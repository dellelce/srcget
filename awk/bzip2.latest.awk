#
# bzip2.latest.awk
#
# created: 1336 290913
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

$0 ~ ext { print $2 }

### end loop ###

END   {
	# this is the end loop
      }
