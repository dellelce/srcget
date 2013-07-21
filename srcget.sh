#!/bin/bash
#
# File:         srcget.sh
# Created:      0322 210713
# Description:  description for srcget.sh
#

### ENV ###

# temporary srcHome....
srcHome="/home/antonio/src/utils/srcget"
profilesDir="$srcHome/profiles"

### FUNCTIONS ###

rawget()
{
 typeset ua="Mozilla/5.0"
 
 typeset url="$1"

 [ -z "$url" ] && return 1

 wget -U "$ua" -O - -q "$url"
}

main()
{
 typeset profile="$1"

 [ -z "$profile" ] && return 1;

 typeset pfp="$profilesDir/${profile}.profile"

 [ ! -f "$pfp" ] && { echo "cannot find profile: $profile [$pfp]"; return 2; }

 . $pfp
 fp_filter="$srcHome/$filter"

 [ -z "srcurl" ] && { echo "invalid url: $srcurl"; return 3; }  

 typeset latest=$(rawget $srcurl | awk -f "$fp_filter")

 echo "Current version is :" $latest
 echo "Full url:          :" $baseurl/$latest

 wget -q "$baseurl/$latest"
}

### MAIN ###

main $*

### EOF ###
