#
# redis.latest.awk
#
# created: 2309 130813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/tar\.gz/ { print $2 } 

### end loop ###

END   {
	# this is the end loop
      }
