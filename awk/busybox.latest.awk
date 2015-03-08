#
# busybox.latest.awk
#
# created: 060813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules
# snapshot rule ignore the nightly snapshot
/busybox/ && /tar.bz2/ && !/tar\.bz2\.sign/ && !/snapshot/ \
{
  ver = $6
}

### end loop ###

END   {
	print ver
      }
