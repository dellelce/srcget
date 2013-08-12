#
# gmpvers.awk
#
# created: 0121 130813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/Release/ { print $5 }

### end loop ###

END   {
	# this is the end loop
      }
