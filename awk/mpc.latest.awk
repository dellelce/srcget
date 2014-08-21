#
# mpcvers.awk
#
# created: 1241 140813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

state == 0 && /Latest/ { state = 1; next; } 

state == 1 && $0 ~ ext { print $2 ; state = 2; next; }

state == 2  { next; } 


### end loop ###

END   {
	# this is the end loop
      }
