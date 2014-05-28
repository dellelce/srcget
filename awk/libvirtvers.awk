#
# libvirtvers.awk
#
# created: 1149 280514
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && !/snapshot/ \
{
  line = $0;
  gsub(/["<>]/, " ", line);

  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ ext)
    {
      vers = item;
    }
  }
}

### END RULE ###

END   {
	if (vers != "") print vers;
      }
