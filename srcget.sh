#!/bin/bash
#
# File:         srcget.sh
# Created:      0322 210713
# Description:  Automate download of source files
#

### ENV ###

# temporary srcHome....
srcHome="$(dirname $0)"
profilesDir="$srcHome/profiles"
wgetArgs="-q --no-check-certificate"
UA="Mozilla/5.0 (http://github.com/dellelce/srcget/)"

### FUNCTIONS ###

# interface to wget

rawget()
{
 typeset url="$1"

 [ -z "$url" ] && return 1

 wget -U "$UA" -O - ${wgetArgs} "$url"
}

# latest version

current_version()
{
 typeset _awk="awk"

 [ ! -z "$skipvers" ] && 
 {
   _awk="${_awk} -vskipvers=$skipvers"
 }

 [ ! -z "$extension_input" ] && 
 {
   _awk="${_awk} -vext=$extension_input"
 }

 [ ! -z "$extension_url" ] && 
 {
   _awk="${_awk} -vexturl=$extension_url"
 }
 
 [ ! -z "$sep" ] &&
 {
   _awk="${_awk} -F\\${sep}"
 }

 rawget "$srcurl" | ${_awk} -f "$fp_filter";
}

# main

main()
{
 typeset profile="$1"

 [ -z "$profile" ] && return 1;

 typeset pfp="$profilesDir/${profile}.profile"

 [ ! -f "$pfp" ] && { echo "cannot find profile: $profile [$pfp]"; return 2; }

 . $pfp
 fp_filter="$srcHome/$filter"

 [ -z "srcurl" ] && { echo "invalid url: $srcurl"; return 3; }  

 typeset latest=$(current_version)

 [ -z "$latest" ] && 
 {
   echo "couldn't retrieve latest version"
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

cat << EOF
Profile            : $pfp
Current version is : $latest
Full url:          : $fullurl
Filename           : $fn
EOF

 [ -z "$fullurl" ] && 
 {
  echo "invalid full url!"
  return 1
 }

 [ ! -f "$fn" ] && 
 {
  wget ${wgetArgs} -O - "$fullurl" > "$fn"
  return $?
 } ||
 { 
  echo "File $fn exists"
 }
}

### MAIN ###

main $*

### EOF ###
