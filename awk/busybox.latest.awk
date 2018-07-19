#
# busybox.latest.awk
#
# created: 060813
#

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules
/busybox/ && $0 ~ ext && !/snapshot/ && !/\.sig/ && !/\.sha256/ \
{
  ver = $6
}

### end loop ###

END   {
	print ver
      }
### EOF ##
