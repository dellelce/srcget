#
# lua.latest.awk
#
# created: 0030 041013
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

state == 0 && /current release is/ { state = 1; next; }
state == 1 { vers = $2; state = 0; next; }


### end loop ###

END   {
	print vers
      }
