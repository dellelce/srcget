#
# drupal.latest.awk
#
# created: 090214
#

### MAIN RULE ###

BEGIN {
        url=""
        state = 0
        print ""
      }

# custom rules

state == 0 && /stable/ \
{
 print "#DEBUG: stable found: " $0
 state = 1
}

#
state == 1 && /[0-9]+\.[0-9]+\.[0-9]+/ \
{
 line = $0
 gsub(/[<>\/\"]/, " ", line);
 split(line, line_a, " ");

 print("#DEBUG: matched line = "line)

 for (idx in line_a)
 {
  item = line_a[idx]

  if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/)
  {
   vers = item;
   # ignore next entries
   state = 2;
  }
 }
}

### END RULE ###

END   {
	print "latest="vers
      }

### EOF ###
