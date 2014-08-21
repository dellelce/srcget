#
# opensshvers.awk
#
# created: 1356 140913
#

### FUNCTIONS ###

### MAIN LOOP ###

  $2 ~ ext && !/gz\.[a-z]/ { ver = $2 }

### END RULE ###

 END { print ver }
