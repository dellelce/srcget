#
# astrometry.latest.awk
#
# created: 0032 200813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/tar\.bz2/ { print $2 }

### end loop ###

END   {
	# this is the end loop
      }
