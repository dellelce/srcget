#!/bin/bash
#
# Automate download of source files
#
# File:         srcget.sh
# Created:      210713
#

### ENV ###

timeout="10"
[ ! -d "$TMP" ] && TMP="/tmp"
timeStamp="$(date +%s)"
#wget options to manage cookies
cookieFile="$TMP/cookies.srcget.${timeStamp}.$RANDOM$RANDOM.txt"
cookieOptions="--load-cookies=$cookieFile --save-cookies=$cookieFile"
wgetArgs="-T ${timeout} -q --no-check-certificate ${cookieOptions}"

NAMEONLY=0
ERR4SLEEP=2  # time to sleep before error 4 (can be a temporary network issue)

# User Agent: sourceforge sends us html if we use anything Mozilla/5.0 so this was changed
srcget_version="0.0.9.11"
homePage="http://github.com/dellelce/srcget/"
UA="srcget/${srcget_version} (+${homePage})"

unset SILENT DEBUG

export LANG="en_GB.UTF-8" # to have more consitence in output across all platforms

### FUNCTIONS ###

# function: fileType: return initial portion of "file"
fileType()
{
 typeset fn="$1"
 [ -z "$fn" ] && return 1

 file -b "$fn" |awk ' { print $1 } '
 return 0
}

cleanup()
{
 [ ! -z "$DEBUG" ] && return 0 # do not cleanup if debugging
 rm -f $cookieFile
 [ ! -z "$version_output" ] && rm -f "$version_output"
 [ ! -z "$get_output" ] && rm -f "$get_output"
}

#
# usage
usage()
{
 cat  << EOF
$0 [options] program_name

 -h  Display this help message
 -A  Download all packages
 -L  List all 'packages'
 -I  Information about package
 -x  Turn on debug mode
 -n  Quiet mode: show filename only
 -q  Quiet mode: don't show anything
 -d  Delete file after download (for testing)
 -F  Force specific Filter
 -H  Debug: return server HTTP headers
 -D  Testing: download remote url only
 -N  Do not download: used to check latest version

EOF
}

#
# getlinkdir
#
getlinkdir()
{
 typeset link="$1"
 typeset cwd="$PWD"
 typeset dest destdir base

 while [ -h $link ]
 do
  dest=$(
  {
   for item in $(ls -lt $link);
   do
    echo $item;
   done
  } | awk  \
  '
    BEGIN { state = 0; }
    state == 0 && $1 == "->" { state = 1 ; next; }
    state == 1 { print; state = 0; next; }
  '
)
  destdir=$(dirname $dest)
  base=$(basename $dest 2>/dev/null)

  [ "$?" -ne 0 ] && { return 1; }

  cd $destdir 2>/dev/null || { cd "$(dirname $link)/$destdir"; }
  link="$PWD/$base"
 done

 cd "$cwd"
 echo $(dirname $link)
 return $?
}

# function: echo wrapper
srcecho()
{
 [ -z "$SILENT" ] && echo $*
}

# function: wrapper to wget
rawget()
{
 typeset url="$1"

 [ -z "$url" ] && return 1
 [ -z "$wgetHeaders" ] && { wget -U "$UA" -O - ${wgetArgs} "$url"; return $?; }

 wget -U "$UA" -O - ${wgetArgs} ${wgetHeaders} "$url"

 # keep wget return code
 return $?
}

# function: info_banner: display download details (usually interactive mode only)
info_banner()
{
 typeset info_version
 [ ! -z "$SILENT" -o "$NAMEONLY" -ne 0 ] && return
 [ ! -z "$version" ] && info_version="$version" || info_version="$latest"
 cat << EOF
Profile            : $pfp
Source             : $srcurl
Current version is : $info_version
Download url       : $fullurl
Filename           : $fn
EOF
}


# function: current_version: extract "latest" version from source url given in profile
# TODO: use arguments instead of global variables!
current_version()
{
 typeset _awk="awk"
 typeset _args=""
 typeset rc=0
 typeset legacy_version=""
 typeset version=""
 typeset versionpath=""
 typeset tmpid="currentversion_${RANDOM}${RANDOM}"
 get_output="$TMP/${tmpid}.get.txt" # not local so it can be picked by cleanup function

 # setup awk args
 [ ! -z "$DEBUG" ] && { _awk="${_awk} -vdebug=1"; }
 [ ! -z "$skipvers" ] && { _awk="${_awk} -vskipvers=$skipvers"; }
 [ ! -z "$extension_input" ] && { _awk="${_awk} -vext=$extension_input"; }
 [ ! -z "$extension_url" ] && { _awk="${_awk} -vexturl=$extension_url"; }
 [ ! -z "$sep" ] && { _awk="${_awk} -F${sep}"; }
 [ ! -z "$pkgprofile" ] && { _awk="${_awk} -vpkgprofile=$pkgprofile"; }
 [ ! -z "$pkgbase" ] && { _awk="${_awk} -vpkgbase=$pkgbase"; }
 [ ! -z "$customout" ] && { _awk="${_awk} -vcustomout=$customout"; }

 rawget "$srcurl" > "$get_output"
 rc=$?

 [ $rc -ne 0 ] && return $rc

 # setup awk args
 [ ! -z "$DEBUG" ] && { _args="${_args} -vdebug=1"; }
 [ ! -z "$skipvers" ] && { _args="${_args} -vskipvers=$skipvers"; }
 [ ! -z "$extension_input" ] && { _args="${_args} -vext=$extension_input"; }
 [ ! -z "$extension_url" ] && { _args="${_args} -vexturl=$extension_url"; }
 [ ! -z "$sep" ] && { _args="${_args} -F${sep}"; }
 [ ! -z "$pkgprofile" ] && { _args="${_args} -vpkgprofile=$pkgprofile"; }
 [ ! -z "$pkgbase" ] && { _args="${_args} -vpkgbase=$pkgbase"; }
 [ ! -z "$customout" ] && { _args="${_args} -vcustomout=$customout"; }

 export opt_match
 export opt_nonmatch
 ${_awk} ${_args} \
         -vbaseurl="${baseurl}" \
         -f "$fp_filter" < "$get_output"  |
 awk ' FNR == 1 && !/^$/ && $1 !~ /^#/ { print "legacy_version=\""$0"\""; next; }
       FNR > 1 { print }'
 rc=$?
 # we don't need "opt_*" anywhere else
 unset opt_match
 unset opt_nonmatch

 rm -f "$get_output"

 return $rc
}

# function: is_valid_url: mini-sanity check
is_valid_url()
{
  [ $(echo "$1" | grep -c '://') -eq 0 ] && return 1
  return 0
}

# function: load_profile: load a single profile
# return codes:
#   1    Invalid arguments
#   2    Profile not found
#   3    Filter not found
#
load_profile()
{
 ## Load profile information
 export profile="$1"

 [ -z "$profile" ] && return 1;

 [ -f "$profile" ] &&
 {
  pfp="$profile"
 } ||
 {
  export pfp="$profilesDir/${profile}.profile"
  export pfch="${profile:0:1}"; pfch=${pfch,,[a-z]}
  export altpfp="$profilesDir/${pfch}/${profile}.profile"

  [ ! -f "$pfp" -a ! -f "${altpfp}" ] && { srcecho "cannot find profile: $profile"; return 2; }
  [ ! -f "$pfp" ] && pfp="${altpfp}"
 }

 # TODO: Improve handling of variables
 unset basename
 unset baseurl
 unset custom_file_postfix
 unset custom_file_prefix
 unset custom_url_postfix
 unset custom_url_prefix
 unset extension
 unset extension_input
 unset extension_url
 unset latest latestawk
 unset sep
 unset skipvers
 unset srcurl
 unset fullurl
 unset comment
 unset bulkenabled
 unset version_holder
 unset custom_url
 unset opt_match
 unset opt_nonmatch
 unset pkgprofile
 unset pkgbase
 unset customout
 unset version
 unset custom_file
 . $pfp
 [ -z "$FORCEFILTER" ] && { latestawk="$latest"; unset latest; } || { latestawk="$FORCEFILTER"; }
 export filter="$latestawk" # un-resolved filter name

 for fp_filter in \
   "$srcHome/awk/${latestawk}.latest.awk" \
   "$srcHome/awk/${latestawk}" \
   "$srcHome/latest/${latestawk}.latest.awk" \
   "$srcHome/latest/${latestawk}" \
   "$srcHome/${latestawk}.latest.awk" \
   "$srcHome/${latestawk}"
 do
  [ -f "$fp_filter" ] && { export fp_filter; break; }
 done

 [ ! -f "$fp_filter" ] && return 3
 return 0
}

# function: main_single: this is the core of this software
main_single()
{
 typeset profile="$1"
 typeset profileRc=0
 typeset latest="" legacy_version="" # set by current_version function
 fn="" # needs to be empty but cannot be local

 [ ! -z "$DEBUG" ] && { echo "DEBUG: profile: $profile"; }

 load_profile $profile
 profileRc=$?

 # Sanity checks
 [ $profileRc -eq 3 ] && { srcecho "${profile}: filter not found: ${filter}"; return 4; }
 [ -z "$srcurl" -o -z "$fp_filter" ] && { return $profileRc; } # just return if any of these are empty
 [ $profileRc -ne 0 ] && { srcecho "${profile}: load profile failed: rc = $profileRc"; return $profileRc; }

 # Find latest software version
 version_output="${TMP}/current_version.${RANDOM}${RANDOM}.txt"
 current_version > $version_output
 typeset latest_rc="$?"  # wget failures

 typeset output_cnt=$(cat $version_output | wc -l)

 #TODO: error management needs to be reviewed
 [ "$output_cnt" -eq 0 ] &&
 {
   srcecho "${profile}: couldn't process website: rc = $latest_rc"
   return $latest_rc
 }

 [ ! -z "$DEBUG" -a -f "$version_output" ] && cat "$version_output"

 [ "$latest_rc" -ne 0 ] &&
 {
  srcecho "${profile}: current_version failed with return code ${latest_rc}"
  return ${latest_rc};
 }

 . $version_output
 typeset version_rc=$?  # rc from processing output generated by awk
 rm -f "$version_output"

 [ ! -z "$legacy_version" ] && latest="$legacy_version"

 [ "$latest" != "${latest#ERRINPUT}" ] && { srcecho "${profile}: couldn't retrieve latest version: error in processing site content"; return 1; }
 [ -z "$latest"  ] && { srcecho "${profile}: couldn't retrieve latest version: rc = $version_rc"; return 1; }

 [ -z "$custom_file" ] && { fn=$(basename $latest 2>/dev/null); } || fn="$custom_file"

 # sanity tests
 [ $? -ne 0 ] && { echo "${profile}: error processing latest version: $latest"; return 1; }

 export fullurl="" # export to allow visibility upstream

 # if custom_url is set it will be used exclusively to set fullurl
 [ -z "$custom_url" ] &&
 {
  [ -z "$custom_url_prefix" -a -z "$custom_url_postfix" ] &&
  {
   [ -z "$baseurl" ] &&
   {
    fullurl="$latest"
   } ||
   {
     fullurl="$baseurl/$latest"
   }
  } ||
  {
   fullurl="${custom_url_prefix}${latest}${custom_url_postfix}"
  }
 }

 [ ! -z "$custom_file_prefix" -o ! -z "$custom_file_postfix" ] &&
 {
  fn="${custom_file_prefix}${fn}${custom_file_postfix}";
 }

 [ ! -z "$version_holder" ] &&
 {
  typeset vh_latest=${version:-${latest}}
  fn="${fn//${version_holder}/${vh_latest}}"
 }

 [ -z "$custom_url"  ] &&
 {
  info_banner

  [ "${fullurl}" != "${fullurl/ERRINPUT/}" ] &&
  { echo "${profile}: failed retrieving download url from website: ${srcurl}"; return 3; }

  [ -z "$fullurl" ] && { srcecho "${profile}: invalid full url!"; return 3; }
 }

 # issue with "||" as "else" will use two test blocks for now
 [ ! -z "$custom_url" ] &&
 {
  fullurl="$custom_url"
 }

 # check if: NO Download Option has been chosen
 [ "$NODOWNLOAD" -eq 1 ] &&
 {
  [ "$NAMEONLY" -ne 0 ] && { echo "$fn"; }
  return 0
 }

 # check if file already exists and is not empty
 [ -s "$fn" ] &&
 {
  [ "$NAMEONLY" -eq 1 ] && { echo "$fn"; return 0; }
  srcecho "${profile}: File $fn exists"
  return 0
 }

 # Check if fullurl has version_holder if so replace with found version
 [ ! -z "$version_holder" ] &&
 {
  typeset vh_latest=${version:-${latest}}
  typeset new_fullurl="${fullurl//${version_holder}/${vh_latest}}"

  [ "$new_fullurl" != "$fullurl" ] && fullurl="$new_fullurl"

  info_banner
 }

 # Main package download entrypoint
 rawget "$fullurl" > "$fn"
 rc=$?

 # rc=4 can be a temporary network issue: try again
 [ "$rc" -eq 4 ] &&
 {
  sleep $ERR4SLEEP
  rawget "$fullurl" > "$fn"
  rc=$?
 }

 [ "$NAMEONLY" -eq 1 -a "$rc" -eq 0 ] && { echo "$fn"; }  # print only-name and successful
 [ "$NAMEONLY" -eq 1 -a "$rc" -ne 0 ] && { echo "${profile}: failed to download: $fn"; } # print only-name and failed

 [ $rc -ne 0 ] && { srcecho "${profile}: wget failed with return code: $rc"; rm -f -- "$fn"; return $rc; }
 # test empty file

 [ ! -s "$fn" ] && { srcecho "${profile}: downloaded empty file"; rm -f -- "$fn"; return 10; }
 [ $(fileType $fn |awk  '{ print $1 } ' ) == "HTML" ] &&
  { srcecho "${profile}: invalid output format: HTML"; rm -- "$fn"; return 11; }

 # Delete file if asked (used for bulk testing)
 [ "$DELETEFILE" -eq 1 ] && { rm -f "$fn"; }

 return $rc
}

# function: info_single
info_single()
{
 typeset profile="$1"
 typeset profileRc=0
 typeset aList="basename baseurl custom_file_postfix
                custom_file_prefix custom_url_postfix custom_url_prefix extension
		extension_input extension_url filter sep skipvers srcurl comment bulkenabled"
 typeset aItem

 load_profile $profile
 profileRc=$?

 # Sanity checks
 [ -z "$srcurl" -o -z "$fp_filter" ] && { return $profileRc; } # just return if any of these are empty
 [ ! -f "$fp_filter" ] && { srcecho "invalid filter file: $fp_filter"; return 4; }
 [ $profileRc -ne 0 ] && { return 5; }

 for aItem in $aList
 do
  aValue=$(eval echo \$$aItem)
  [ ! -z "$aValue" ] && printf "%-20s %s\n" "$aItem" "$aValue"
 done
}

# function: srcall: download all profiles
srcall()
{
 typeset errcnt=0
 typeset okcnt=0
 typeset fails=""
 typeset item

 [ ! -d "$profilesDir" ] &&
 {
  typeset srcHome=$(getlinkdir "$0")
  typeset profilesDir="$srcHome/profiles"
 }

 [ ! -d "$profilesDir" ] && { echo "Can't find profiles directory!: $profilesDir"; return 20; }

 for item in $profilesDir/*/*.profile $profilesDir/*.profile;
 do
  [ ! -f "$item" ] && continue

  p=$(basename $item); # short profile name
  p=${p%.profile}

  # profile is loaded twice, and this is not a good thing
  load_profile "$item"

  # ignore profiles not enabled for bulk (srcall): profiles in development
  [ "$bulkenabled" == "no" -o "$bulkenabled" == "n" ] && continue
  [ -z "$basename" ] && { basename="${p}"; } # override if set in profile!

  SILENT=1 main_single $item # always run main_single silently
  rc="$?"

  # wget appears to return 1 on success.......(!?)
  [ $rc -eq 0 -a "$NAMEONLY" -eq 0 ] &&
  {
   let okcnt="(( $okcnt + 1 ))"
   srcecho "${p}: downloaded: ${fn}"
   continue
  }

  [ $rc -eq 2 ] && { continue; } # = Ignore rc=2 as it is not a real error...

  typeset msg="${p}: error: $rc"

  [ $rc -eq 8 ] && { msg="$msg (NOT FOUND: $fullurl)"; }
  [ $rc -eq 11 ] && { msg="$msg (INVALID FORMAT: $fullurl)"; }
  [ $rc -eq 4 ] && { msg="$msg (URL: $fullurl)"; }
  [ $rc -eq 1 ] && { msg="$msg (URL: $fullurl)"; }
  let errcnt="(( $errcnt + 1 ))"
  fails="$fails $p"

  srcecho "$msg"
  unset fullurl
 done

 echo

 [ "$okcnt" -gt 0 ] && { echo "There have been ${okcnt} successful downloads."; }
 [ "$errcnt" -eq 1 ] && { echo "There download for $fails has failed."; return 1; }
 [ "$errcnt" -gt 1 ] && { echo "There have been $errcnt failed downloads: $fails"; return 1; }

 return 0
}

# function: listall
listall()
{
 typeset item b p

 [ ! -d "$profilesDir" ] &&
 {
   export srcHome=$(getlinkdir "$0")
   export profilesDir="$srcHome/profiles"
 }

 [ ! -d "$profilesDir" ] && { echo "Can't find profiles directory!: $profilesDir"; return 20; }

 for item in $profilesDir/*/*.profile
 do
  bitem=$(basename $item)
  withoutprofile=${bitem%.profile}

  echo "$withoutprofile"
 done
 return 0
}

# function: infoall
infoall()
{
 typeset profile=""
 typeset profileRc=0 rc=0

 [ -z "$1" ] && return 1; # Sanity checks

 # Load profile information
 while [ ! -z "$1" ]
 do
  profile="$1"

  info_single "$profile"
  rc="$?"
  shift
 done

 return $rc
}

# function: main
main()
{
 typeset profile=""
 typeset profileRc=0

 # Sanity checks
 [ -z "$1" ] && return 1;

 # Load profile information
 while [ ! -z "$1" ]
 do
  profile="$1"

  main_single "$profile"
  rc="$?"
  shift
 done

 return $rc
}

# function: geturl: url/profile downloader
geturl()
{
 typeset url="$1"
 typeset profileRc=0

 is_valid_url "$url" ||
 {
  # url is actually a profile
  load_profile $url
  profileRc=$?

  [ $profileRc -ne 0 ] && return $profileRc

  is_valid_url "$srcurl" && url="$srcurl" || { srcecho "badprofile"; return 2; }
 }

 rawget $url
}

### MAIN ###

[ -z "$*" ] && { usage; exit 0; }

[ ! -d "$profilesDir" ] &&
{
 typeset srcHome=$(getlinkdir "$0")
 typeset profilesDir="$srcHome/profiles"
}

[ ! -d "$profilesDir" ] && { echo "Can't find profiles directory!: $profilesDir"; exit 20; }

profileList=""
export main="main"
export FORCEFILTER=""
export DEBUG=""
export SILENT=""
export NAMEONLY=0
export NODOWNLOAD=0
export DELETEFILE=0

while [ ! -z "$1" ]
do
 [ "$1" == "-A" ] && { main="srcall"; shift; continue; }
 [ "$1" == "-x" ] && { DEBUG=1; shift; continue; }
 [ "$1" == "-F" ] && { shift; FORCEFILTER="$1"; shift; continue; }
 [ "$1" == "-H" ] && { wgetArgs="$wgetArgs -S"; shift; continue; } # debug headers
 [ "$1" == "-D" ] && { main="geturl"; shift; continue; }
 [ "$1" == "-L" ] && { main="listall"; shift; continue; }
 [ "$1" == "-I" ] && { main="infoall"; shift; continue; }
 [ "$1" == "-q" ] && { SILENT=1; shift; continue; }
 [ "$1" == "-d" ] && { DELETEFILE=1; shift; continue; }
 [ "$1" == "-N" ] && { NODOWNLOAD=1; shift; continue; }
 [ "$1" == "-n" ] && { NAMEONLY=1; shift; continue; }
 [ "$1" == "-h" ] && { usage; main=""; shift; continue; }

 [ "$1" == ${1#-} ] &&
 {
  [ -z "$profileList" ] && profileList="$1" || profileList="${profileList} $1"
 }
 shift
done

[ ! -z "$main" ] &&
{
 eval $main $profileList
 rc=$?
 cleanup

 exit $rc
}

### EOF ###
