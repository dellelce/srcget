#
# systemd.latest.awk
#
# created: 0510 081014
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        env = ""
      }

# custom rules

$0 ~ ext && !/systemd-ui/ \
{
  line = $0;
  gsub(/[<>\"]/, " ", line);

  split(line, line_a, " ");

  for (item in line_a)
  {
    if (line_a[item] ~ ext)
    {
      env = line_a[item]
    }
  }
}

### END RULE ###

END   {
	if (env != "") print env;
      }
