#
# drupal.latest.awk
#
# created: 2205 090214
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        url=""
        state = 0
      }

# custom rules

state == 0 && /stable/ \
{
 state = 1
}

#
state == 1 && /[0-9]+\.[0-9]+\.[0-9]+/ \
{
 line = $0
 gsub(/[<>\/\"]/, " ", line);

 split(line, line_a, " ");

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
	print vers
      }

### EOF ###
