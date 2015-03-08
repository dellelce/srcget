#
# mpfr.latest.awk
#
# created: 1755 120813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/released/  { print $4; } 

### end loop ###

END   {
	# this is the end loop
      }
