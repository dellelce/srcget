#
# editline.latest.awk
#
# created: 040813
#

### FUNCTIONS ###


### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules
state == 0 && /[dD]ownload/  { state = 1 }

state == 1 && !/tar\.gz/ { next } 

state == 1 && /tar\.gz/ { vers = $2 } 

### end loop ###

END   {
        print vers
      }

## EOF ##
