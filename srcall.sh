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

for x in $srcgetDir/profiles/*/*.profile;
do
 [ ! -s "$x" ] && continue

 b=$(basename $x);
 p=${b%.profile};

 basename=""
 . "$x" 
 b="$basename"
 [ -z "$b" ] && b="$p"

# printf "Checking ${p}..."
 srcget -n $p
 rc="$?"

 # 2 = file already exiests
 [ $rc -eq 2 -o $rc -eq 0 ] && { continue; }

 echo "${p}: error: $rc"

done

### EOF ###
