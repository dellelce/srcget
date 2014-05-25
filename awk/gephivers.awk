#
# gephivers.awk
#
# created: 1421 250514
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /sources/ && vers == "" \
{
  line = $0
  gsub(/"/, " ", line);
  split(line, line_a, " ");

  for (line_i in line_a)
  {
    item = line_a[line_i]

    if (item ~ ext && vers == "")
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

### EOF ###
