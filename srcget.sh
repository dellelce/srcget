#!/bin/bash
#
# File:         srcget.sh
# Created:      0322 210713
# Description:  Automate download of source files
#

# wget return codes:
# 0: get_exit_status(): WGET_EXIT_SUCCESS 
# 1: get_exit_status(): if WGET_EXIT_UNKNOWN 1 is returned
# 2: memory allocations,
# 3: invalid or missing arguments, get_exit_status(): WGET_EXIT_MINIMUM, WGET_EXIT_IO_FAIL 
# 4: get_exit_status(): WGET_EXIT_NETWORK_FAIL
# 5: get_exit_status(): WGET_EXIT_SSL_AUTH_FAIL
# 6: get_exit_status(): WGET_EXIT_SERVER_AUTH_FAIL 
# 7: get_exit_status(): WGET_EXIT_PROTOCOL_ERROR 
# 8: get_exit_status(): WGET_EXIT_SERVER_ERROR


### ENV ###

# temporary srcHome....
export srcHome="$(dirname $0)"
export profilesDir="$srcHome/profiles"
timeout="120"
[ ! -d "$TMP" ] && TMP="/tmp"
# Accept-Encoding: we don't like gzip
wgetHeaders='--header="Accept-Encoding:"'
wgetArgs="-T ${timeout} -q --no-check-certificate"
UA="Mozilla/5.0 (http://github.com/dellelce/srcget/)"
NAMEONLY=0

unset SILENT DEBUG

### FUNCTIONS ###

#
# usage
usage()
{
 cat  << EOF 
$0 [options] program_name

 -x  turn on debug mode
 -n  quiet mode: show filename
 -q  quiet mode: don't show filename
 -H  debug: return server HTTP headers (DEBUG ONLY!)
 -D  testing: download remote url only (TEST/DEVELOPMENT ONLY!)

EOF
}

#srcget
getlinkdir()
{
 typeset dest="$1"

 [ -z "$dest"  -o ! -h "$dest" ] && { return 1; } 

 dirname $(
 {  for x in $(ls -lt $dest) ; do echo $x; done ; } | awk  ' 
  BEGIN { state = 0; }
  state == 0 && $1 == "->" { state = 1 ; next; }
  state == 1 { print; state = 0; next; }
'
)

}

# echo wrapper
srcecho()
{
  [ -z "$SILENT" ] && echo $*
}

# interface to wget
rawget()
{
 typeset url="$1"

 [ -z "$url" ] && return 1

 #temp workaround for github - there must be something wrong in github.com webserver..........maybe
 [ $(echo $url | grep -c "github") -eq 1 ] && { unset wgetHeaders; } 

 [ -z "$wgetHeaders" ] && { wget -U "$UA" -O - ${wgetArgs} "$url"; return $?; }

 wget -U "$UA" -O - ${wgetArgs} ${wgetHeaders} "$url"
}

# 
info_banner()
{
  [ ! -z "$SILENT" ] && return 
  cat << EOF
Profile            : $pfp
Current version is : $latest
Full url:          : $fullurl
Filename           : $fn
EOF
}

# latest version

current_version()
{
 typeset _awk="awk"
#TBD: will be used if wget output needs any filtering, not now.
# typeset tmpfile="$TMP/srcget.$RANDOM.$$.dat"
# typeset tmptxt="$TMP/srcget.$RANDOM.$$.dat"

 [ ! -z "$DEBUG" ] && { set -x; _awk="${_awk} -vdebug=1"; }
 [ ! -z "$skipvers" ] && { _awk="${_awk} -vskipvers=$skipvers"; }
 [ ! -z "$extension_input" ] && { _awk="${_awk} -vext=$extension_input"; }
 [ ! -z "$extension_url" ] && { _awk="${_awk} -vexturl=$extension_url"; }
 [ ! -z "$sep" ] && { _awk="${_awk} -F${sep}"; }

 rawget "$srcurl" | ${_awk} -f "$fp_filter";
}

#
# is_valid_url
# mini-sanity chec 
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
 [ ! -d "$profilesDir" -a -h "$0" ] &&
 {
   export srcHome=$(getlinkdir "$0")
   export profilesDir="$srcHome/profiles"
 }

 export pfp="$profilesDir/${profile}.profile"
 [ ! -f "$pfp" ] && { srcecho "cannot find profile: $profile [$pfp]"; return 2; }

 . $pfp
 export fp_filter="$srcHome/$filter"
 return 0
}


## main ##

main()
{
 typeset profileRc=0
 [ ! -z "$DEBUG" ] && set -x

 ## Load profile information
 typeset profile="$1"
 [ -z "$profile" ] && return 1;

 load_profile $profile
 profileRc=$?

 [ $profileRc -ne 0 ] && { srcecho "load profile failed: rc = $profileRc"; return 1; }

 #Sanity checks
 [ -z "srcurl" ] && { srcecho "invalid url: $srcurl"; return 3; }  
 [ ! -f "$fp_filter" ] && { srcecho "invalid filter file: $fp_filter"; return 4; } 

 ## Find latest software version
 typeset latest=$(current_version)

 [ -z "$latest" ] && { srcecho "couldn't retrieve latest version"; return 1; }

 typeset fn=$(basename $latest)
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
   fn="${custom_file_prefix}${fn}${custom_file_postfix}"
 }

 info_banner

 [ -z "$fullurl" ] && { srcecho "invalid full url!"; return 3; }
 [ -f "$fn" ] &&
 {
  [ "$NAMEONLY" -eq 1 ] && { echo $fn; exit 2; } 
  srcecho "File $fn exists"
  exit 2
 }

 wget ${wgetArgs} -O - "$fullurl" > "$fn"
 rc=$?
 [ "$NAMEONLY" -eq 1 ] && { echo $fn; } 
 [ $rc -ne 0 ] && { srcecho "wget failed with return code: $rc"; rm -f "$fn"; exit $rc; }
 # test empty file
 [ ! -s "$fn" ] && { srcecho "downloaded empty file"; exit 1; } 

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

profileName=""
main="main"

while [ ! -z "$1" ] 
do
 [ -z "$2" ] && { profileName="$1"; shift; } 

 [ "$1" == "-x" ] && { export DEBUG=1; set -x; shift; }
 [ "$1" == "-H" ] && { wgetArgs="$wgetArgs -S";  set -x; shift; } # debug headers
 [ "$1" == "-D" ] && { main="geturl"; shift; }
 [ "$1" == "-q" ] && { export SILENT=1; shift; }
 [ "$1" == "-n" ] && { export SILENT=1; export NAMEONLY=1; shift; }

 shift # catch-all shift... we should move to getopt
done

 eval $main $profileName
 exit $?

### EOF ###
