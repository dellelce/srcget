#
# iconv.latest.awk
#
# created: 050813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/libiconv/ && /tar.gz/ && !/tar\.gz\.sig/ \
{
  ver = $6
}

### end loop ###

END   {
	print ver
      }
