#
# aprvers.awk
#
# created: 020614
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && !/_mod/ && vers == "" \
{
  line = $0
  gsub(/["<>]/, " ", line);
  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ ext && vers == "")
    {
      vers = item
    }
  }
}

### END RULE ###

END   {
	if (vers != "") { print vers; } 
      }
