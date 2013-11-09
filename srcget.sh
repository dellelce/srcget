#!/bin/bash
#
# File:         srcget.sh
# Created:      0322 210713
# Description:  Automate download of source files
#

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
srcHome="$(dirname $0)"
profilesDir="$srcHome/profiles"
wgetArgs="-q --no-check-certificate"
UA="Mozilla/5.0 (http://github.com/dellelce/srcget/)"

unset SILENT DEBUG

### FUNCTIONS ###

#
# usage
usage()
{
 cat  << EOF 
$0 [options] program_name

 -x  turn on debug mode
 -q  quiet mode

EOF
}

#
srcecho()
{
  [ -z "$SILENT" ] && echo $*
}

# interface to wget

rawget()
{
 typeset url="$1"

 [ -z "$url" ] && return 1

 wget -U "$UA" -O - ${wgetArgs} "$url"
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

 [ ! -z "$DEBUG" ] && { set -x; _awk="${_awk} -vdebug=1"; }

 [ ! -z "$skipvers" ] && { _awk="${_awk} -vskipvers=$skipvers"; }

 [ ! -z "$extension_input" ] && { _awk="${_awk} -vext=$extension_input"; }

 [ ! -z "$extension_url" ] && { _awk="${_awk} -vexturl=$extension_url"; }
 
 [ ! -z "$sep" ] && { _awk="${_awk} -F${sep}"; }

 rawget "$srcurl" | ${_awk} -f "$fp_filter";
}

# main

main()
{
 [ ! -z "$DEBUG" ] && set -x

 typeset profile="$1"

 [ -z "$profile" ] && return 1;

 typeset pfp="$profilesDir/${profile}.profile"

 [ ! -f "$pfp" ] && { srcecho "cannot find profile: $profile [$pfp]"; return 2; }

 . $pfp
 fp_filter="$srcHome/$filter"

 [ -z "srcurl" ] && { srcecho "invalid url: $srcurl"; return 3; }  
 [ ! -f "$fp_filter" ] && { srcecho "invalid filter file: $fp_filter"; return 4; } 

 typeset latest=$(current_version)

 [ -z "$latest" ] && 
 {
   srcecho "couldn't retrieve latest version"
   return 1
 }

 typeset fn=$(basename $latest)
 typeset fullurl

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
 [ -f "$fn" ] && { srcecho "File $fn exists"; exit 2; }

 wget ${wgetArgs} -O - "$fullurl" > "$fn"
 rc=$?
 [ $rc -ne 0 ] && { srcecho "wget failed with return code: $rc"; rm -f "$fn"; exit $rc; }
 # test empty file
 [ ! -s "$fn" ] && { srcecho "downloaded empty file"; exit 1; } 
 return $rc
}

### MAIN ###

[ "$1" == "-x" ] && { export DEBUG=1; set -x; shift; }
[ "$1" == "-q" ] && { export SILENT=1; shift; }
[ -z "$*" ] && { usage; exit 0; }

main $*
exit $?

### EOF ###
