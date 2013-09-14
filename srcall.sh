#!/bin/bash
#
# File:         srcall.sh
# Created:      1703 100813
# Description:  description for srcall.sh
#

### FUNCTIONS ###

srcget()
{
 typeset srcget="$srcgetDir/srcget.sh"

 [ ! -f "$srcget" ] && return 1
 [ ! -x "$srcget" ] && return 2

 $srcget $*
}

### ENV ###


srcgetDir="$(dirname $0)"

### MAIN ###

[ ! -d "$srcgetDir/profiles" ] &&
{
  echo "Can't find profiles directory!: $srcgetDir/profiles"
  exit 2
}

for x in $srcgetDir/profiles/*;
do
 b=$(basename $x);
 p=${b%.profile};


 printf "Checking ${p}..."
 srcget $p > /dev/null
 rc="$?"

 # wget appears to return 1 on success.......(!?)
 [ $rc -eq 0 -o $rc -eq 1 ] && { echo "downloaded"; continue; } 
 [ $rc -eq 2 ] && { echo "already latest"; continue; }

 echo "error: $rc"

done


### EOF ###
