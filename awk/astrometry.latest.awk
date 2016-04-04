#
# astrometry.latest.awk
#
# created: 0032 200813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

$0 ~ ext && /astrometry\.net/ && !/-pre/ \
{
 line = $0
 gsub(/[<>"]/, " ", line);

 split(line, line_a, " ");

 for(idx in line_a)
 {
  item = line_a[idx]

  if (item ~ ext && item ~ /[0-9]+\.[0-9]+/)
  {
   vers = item
  }
 }
}

### end rule ###

END   {
	print vers
      }
