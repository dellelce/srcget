#
# geanyvers.awk
#
# created: 1445 160514
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && vers == "" \
{
  line = $0
  gsub(/'/, " ", line);
  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ ext && item !~ /\.sig$/ && vers == "")
    {
      vers = item
    }
  }
}

### END RULE ###

END   {
	if (vers != "")
        {
          print vers
        }
      }
