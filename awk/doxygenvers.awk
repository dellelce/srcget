#
# doxygenvers.awk
#
# created: 1724 230813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/tar\.gz/&&/src/&&/http:/ { print $2 }

### end loop ###

END   {
	# this is the end loop
      }
