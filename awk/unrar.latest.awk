#
# unrar.latest.awk
#
# created: 1709 230813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/unrarsrc/&&/tar\.gz/ { print $2 } 

### end loop ###

END   {
	# this is the end loop
      }
