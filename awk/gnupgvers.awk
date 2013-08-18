#
# gnupgvers.awk
#
# created: 1632 180813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/is the well known/ \
{
   split($2, v_a, ">");
   vers = v_a[2];
}


### end loop ###

END   {
	print vers
      }
