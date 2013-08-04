#
# gccvers.awk
#
# created: 0331 060513
# updated: during 060513

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
