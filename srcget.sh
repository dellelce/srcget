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
#
cookieFile="$TMP/cookies.srcget.${timeStamp}.$RANDOM$RANDOM.txt"
cookieOptions="--load-cookies=$cookieFile --save-cookies=$cookieFile"
wgetArgs="-T ${timeout} -q --no-check-certificate ${cookieOptions}"
version="0.0.6.6"
homePage="http://github.com/dellelce/srcget/"
UA="Mozilla/5.0 (compatible; srcget/${version}; +${homePage}) Dummy/0.0.0 (KHTML, like Gecko)"
NAMEONLY=0

unset SILENT DEBUG

### FUNCTIONS ###

#
# fileType: return initial portion of "file"
# 
fileType()
{
 typeset fn="$1"
 [ -z "$fn" ] && return 1

 file -b "$fn" |awk ' { print $1 } ' 
 return 0
}


#
# cleanup
#
 cleanup()
 {
  rm -f $cookieFile
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
 -H  Debug: return server HTTP headers (DEBUG ONLY!)
 -D  Testing: download remote url only (TEST/DEVELOPMENT ONLY!)

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

# echo wrapper
srcecho()
{
 [ -z "$SILENT" ] && echo $*
}

# wrapper to wget
rawget()
{
 typeset url="$1"

 [ -z "$url" ] && return 1

 #temp workaround for github - there must be something wrong in github.com webserver..........maybe
 [ $(echo $url | grep -c "github") -eq 1 ] && { unset wgetHeaders; } 

 [ -z "$wgetHeaders" ] && { wget -U "$UA" -O - ${wgetArgs} "$url"; return $?; }

 wget -U "$UA" -O - ${wgetArgs} ${wgetHeaders} "$url"

 # keep wget return code
 return $? 
}

# 
info_banner()
{
  [ ! -z "$SILENT" -o "$NAMEONLY" -ne 0 ] && return 
  cat << EOF
Profile            : $pfp
Source             : $srcurl
Current version is : $latest
Download url       : $fullurl
Filename           : $fn
EOF
}


#
# current_version: extract "laest" version from source url given in profile
#
# Issues: expects profile to be already loaded and attributes set in environment
#
current_version()
{
 typeset _awk="awk"

 # setup awk args
 [ ! -z "$DEBUG" ] && { set -x; _awk="${_awk} -vdebug=1"; }
 [ ! -z "$skipvers" ] && { _awk="${_awk} -vskipvers=$skipvers"; }
 [ ! -z "$extension_input" ] && { _awk="${_awk} -vext=$extension_input"; }
 [ ! -z "$extension_url" ] && { _awk="${_awk} -vexturl=$extension_url"; }
 [ ! -z "$sep" ] && { _awk="${_awk} -F${sep}"; }

 rawget "$srcurl" | ${_awk} -vbaseurl="${baseurl}" -f "$fp_filter";
 return $? # unneeded?
}

#
# is_valid_url
# mini-sanity check 
#
is_valid_url()
{
 typeset url="$1"

 [ $(echo $url | grep -c '://') -eq 0 ] && return 1

 return 0
}

#
load_profile()
{
 ## Load profile information
 export profile="$1"
 [ -z "$profile" ] && return 1;

 # try harder to make sure profilesDir is correct
 [ ! -d "$profilesDir" ] &&
 {
   export srcHome=$(getlinkdir "$0")
   export profilesDir="$srcHome/profiles"
 }

 export pfp="$profilesDir/${profile}.profile"
 [ ! -f "$pfp" ] && { srcecho "cannot find profile: $profile [$pfp]"; return 2; }

 unset basename
 unset baseurl
 unset custom_file_postfix
 unset custom_file_prefix
 unset custom_url_postfix
 unset custom_url_prefix
 unset extension
 unset extension_input
 unset extension_url
 unset latest
 unset sep
 unset skipvers
 unset srcurl
 unset comment
 unset bulkenabled
 . $pfp
 export fp_filter="$srcHome/$latest"
 return 0
}

#
# main_single
# this is the core of this software
#
main_single()
{
 typeset profile="$1"
 typeset profileRc=0
 [ ! -z "$DEBUG" ] && set -x

 load_profile $profile
 profileRc=$?

 [ $profileRc -ne 0 ] &&
  { srcecho "${profile}: load profile failed: rc = $profileRc"; return $profileRc; }

 #Sanity checks
 [ -z "srcurl" ] && { srcecho "${profille}: invalid url: $srcurl"; return 3; }  
 [ ! -f "$fp_filter" ] && { srcecho "${profile}: invalid filter file: $fp_filter"; return 4; } 

 ## Find latest software version
 typeset latest=$(current_version)
 typeset latest_rc="$?"

 [ "$latest_rc" -ne 0 ] && { srcecho "${profile}: current_version failed with return code ${latest_rc}"; return ${latest_rc}; }
 [ "$latest" != "${latest#ERRINPUT}" ] && { srcecho "${profile}: couldn't retrieve latest version: error in processing site content"; return 1; }
 [ -z "$latest" ] && { srcecho "${profile}: couldn't retrieve latest version: wget rc = $latest_rc"; return 1; }

 typeset fn=$(basename $latest 2>/dev/null)

 # sanity tests
 [ $? -ne 0 ] && { echo "${profile}: error processing latest version: $latest"; return 1; }

 typeset fullurl=""

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

 [ ! -z "$custom_file_prefix" -o ! -z "$custom_file_postfix" ] &&
 {
  fn="${custom_file_prefix}${fn}${custom_file_postfix}";
 }

 info_banner

 [ "${fullurl}" != "${fullurl/ERRINPUT//}" ] &&
 { echo "${profile}: failed retrieving download url from website: ${srcurl}"; return 3; }

 [ -z "$fullurl" ] && { srcecho "${profile}: invalid full url!"; return 3; }

 # check if file already exists and is not empty
 [ -s "$fn" ] &&
 {
  [ "$NAMEONLY" -eq 1 ] && { echo "$fn"; return 0; }
  srcecho "${profile}: File $fn exists"
  return 0
 }

 rawget "$fullurl" > "$fn"
 rc=$?

 [ "$NAMEONLY" -eq 1 -a "$rc" -eq 0 ] && { echo "$fn"; }  # print only-name and successful
 [ "$NAMEONLY" -eq 1 -a "$rc" -ne 0 ] && { echo "${profile}: failed to download: $fn"; } # print only-name and failed

 [ $rc -ne 0 ] && { srcecho "${profile}: wget failed with return code: $rc"; rm -f "$fn"; return $rc; }
 # test empty file

 [ ! -s "$fn" ] && { srcecho "${profile}: downloaded empty file"; rm -f "$fn"; return 10; } 
 [ $(fileType $fn |awk  '{ print $1 } ' ) == "HTML" ] &&
  { srcecho "${profile}: invalid output format: HTML"; rm "$fn"; return 11; }

 return $rc
}

#
# info_single
#
info_single()
{
 typeset profile="$1"
 typeset profileRc=0
 typeset aList="basename baseurl custom_file_postfix custom_file_prefix custom_url_postfix custom_url_prefix extension 
		extension_input extension_url filter sep skipvers srcurl comment bulkenabled"
 typeset aItem

 [ ! -z "$DEBUG" ] && set -x

 load_profile $profile
 profileRc=$?

 #Sanity checks
 [ -z "srcurl" ] && { srcecho "invalid url: $srcurl"; return 3; }  
 [ ! -f "$fp_filter" ] && { srcecho "invalid filter file: $fp_filter"; return 4; } 
 [ $profileRc -ne 0 ] && { return 5; } 

 for aItem in $aList
 do
  aValue=$(eval echo \$$aItem)
  [ ! -z "$aValue" ] && printf "%-20s %s\n" "$aItem" "$aValue"
 done
}

#
# wget_pkg
# TO REMOVE?
#
wget_pkg()
{
 wget ${wgetArgs} -O - "$fullurl" > "$fn"
 rc=$?
 [ "$NAMEONLY" -eq 1 -a "$rc" -eq 0 ] && { echo $fn; return 0; }
 [ $rc -ne 0 ] && { srcecho "wget failed with return code: $rc"; rm -f "$fn"; return $rc; }
 # test empty file
 [ ! -s "$fn" ] && { srcecho "downloaded empty file"; rm -f "$fn"; return 10; } 

 return $rc
}

#
# srcall
# check all profiles
#
srcall()
{
 [ ! -d "$profilesDir" ] &&
 {
  typeset srcHome=$(getlinkdir "$0")
  typeset profilesDir="$srcHome/profiles"
 }

 typeset b p item

 [ ! -d "$profilesDir" ] &&
 {
  echo "Can't find profiles directory!: $profilesDir"
  return 20
 }

 for item in $profilesDir/*;
 do
  b=$(basename $item);
  p=${b%.profile};

  # profile is loaded twice, and this is not a good thing, but for now we can live with it....
  load_profile "$p"
  [ "$bulkenabled" == "no" -o "$bulkenabled" == "n" ] && continue # ignore profiles not enabled for bulk (srcall): profiles in development
  [ -z "$basename" ] && { basename="${p}"; } # override if set in profile!

  # always run main_single silently
  SILENT=1 main_single $p
  rc="$?"

  # wget appears to return 1 on success.......(!?)
  [ $rc -eq 0 -a "$NAMEONLY" -eq 0 ] && { srcecho "${p}: downloaded: $(ls -t *${basename}* | head -1)"; continue; }
  [ $rc -eq 2 ] && { continue; }

  srcecho "${p}: error: $rc"
 done
 return 0
}

#
# listall
#
listall()
{
 typeset item b p

 [ ! -d "$profilesDir" ] &&
 {
   export srcHome=$(getlinkdir "$0")
   export profilesDir="$srcHome/profiles"
 }

 [ ! -d "$profilesDir" ] &&
 {
   echo "Can't find profiles directory!: $profilesDir"
   return 20
 }

 for item in $profilesDir/*;
 do
  b=$(basename $item);
  p=${b%.profile};

  b="$p"

  echo $b
 done
 return 0
}

#
# infoall
infoall()
{
 typeset profile=""
 typeset profileRc=0 rc=0
 [ ! -z "$DEBUG" ] && set -x

 #Sanity checks
 [ -z "$1" ] && return 1;

 ## Load profile information

 while [ ! -z "$1" ]
 do
  profile="$1"

  info_single "$profile"
  rc="$?"
  shift
 done

 return $rc
}

#
# main
main()
{
 typeset profile=""
 typeset profileRc=0
 [ ! -z "$DEBUG" ] && set -x

 #Sanity checks
 [ -z "$1" ] && return 1;

 ## Load profile information

 while [ ! -z "$1" ]
 do
  profile="$1"

  main_single "$profile"
  rc="$?"
  shift
 done

 return $rc
}

# url/profile downloader
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

profileList=""
export main="main"
export DEBUG=""
export SILENT=""
export NAMEONLY=0

while [ ! -z "$1" ] 
do
 [ "$1" == "-A" ] && { main="srcall"; shift; continue; }
 [ "$1" == "-x" ] && { DEBUG=1; set -x; shift; continue; }
 [ "$1" == "-H" ] && { wgetArgs="$wgetArgs -S";  set -x; shift; continue; } # debug headers
 [ "$1" == "-D" ] && { main="geturl"; shift; continue; }
 [ "$1" == "-L" ] && { main="listall"; shift; continue; }
 [ "$1" == "-I" ] && { main="infoall"; shift; continue; }
 [ "$1" == "-q" ] && { SILENT=1; shift; continue; }
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
