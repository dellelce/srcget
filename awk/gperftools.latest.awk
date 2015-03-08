#
# gperftools.latest.awk
#
# created: 110514
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /[0-9]\.[0-9]/ && vers == "" \
{
  line = $0
  gsub(/[<>"]/, " ", line);
  
  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    # latest release appears to be released on google drive - only
    if (item ~ ext && item ~ /[0-9]\.[0-9]/ && item ~ /http/ && vers == "")
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
