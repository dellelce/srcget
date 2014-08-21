#
# pixmanvers.awk
#
# created: 050813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/pkg-config/ && /tar.gz/ \
{
  ver = $8
}

### end loop ###

END   {
	print ver
      }
