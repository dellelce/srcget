#
# readlinevers.awk
#
# created: 040813
#

### FUNCTIONS ###


### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules
state == 0 && /The current version of readline is/ \
{
 state = 1
 next
}

state == 1 \
{
  vers = $2
  state = 0; next
}

### end loop ###

END   {
        print vers
      }

## EOF ##
