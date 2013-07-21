#!/bin/bash
#
# File:         testawk.sh
# Created:      0110 170513
# Description:  description for testawk.sh
#

### FUNCTIONS ###

### ENV ###

code="${1}"
inUrl="${2}"

### MAIN ###

[ ! -f "${code}" ] && { echo "invalid code file"; exit 1; }
[ -z "${inUrl}" ] && { echo "missing url"; exit 2; }

wget -q -O - "${inUrl}" | awk -f "${code}"

### EOF ###
