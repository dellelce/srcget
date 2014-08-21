#
# libyamlvers.awk
#
# created: 1623 180813
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
