#
# busybox.latest.awk
#
# created: 060813
#

### MAIN LOOP ###

BEGIN {
        state = 0
        print ""
      }

# custom rules

$0 ~ ext && ($0 ~ !/snapshot/ && !/\.sig/ && !/\.sha256/) \
{
  gsub(/["<>]/, " ");
  cnt = split($0, a, " ");
  for (idx in a)
  {
    item = a[idx]
    if (item ~ /[0-9]+.[0-9]+/ && item ~ ext)
    {
      print "#DEBUG: match: " item
      ver = item
      next
    }
  }
}

### end loop ###

END   {
	print "latest="ver
      }

### EOF ##
