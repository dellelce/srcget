#
# networkx.latest.awk
#
# created: 2003 310314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
        vers = ""
      }

# custom rules

state == 0 && /Latest Release/ { state = 1; next; } 

state == 1 &&  /[0-9]+\.[0-9]+/ \
{
  split($0, vers_a)
  
  for (idx in vers_a)
  {
    if (vers_a[idx] ~ /[0-9]+\.[0-9]+/)
    {
      vers = vers_a[idx]
      state = 2
      next
    }
  }
}


### END RULE ###

END   {
	if (vers != "") print vers;
      }
