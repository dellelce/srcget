#!/bin/bash
#
# File:         fixawk.sh
# Created:      1605 050813
# Description:  description for fixawk.sh
#

### FUNCTIONS ###

### ENV ###

### MAIN ###

for x in *.awk;
do
  gitdate=$(git log $x | awk '

/Date:/ { date = $3 " " $4; }

 END { print date; }
'
)
  echo $x $( awk ' NR==2 { iname = $2; }  /created/ { print "iname=\""iname "\"; idate=\"" $4 "\"" } ' $x) $gitdate;

#  read
done

### EOF ###
