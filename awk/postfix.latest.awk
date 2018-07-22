#
# postfix.latest.awk
#
# created: 1732 200814
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/[Rr]elease/ && /[0-9]+\.[0-9]+\.[0-9]/ && vers == "" \
{
  line = $0
  gsub(/[<>]/, " ", line);
  gsub(/,/, " ", line);

  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /[0-9]+\.[0-9]+\.[0-9]/ && vers == "")
    {
      vers = item
      sub(/\.$/, "", vers);
    }
  }
}

### END RULE ###

END   {
	if (vers != "") print vers;
      }
