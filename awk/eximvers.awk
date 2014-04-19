#
# eximvers.awk
#
# created: 0258 190414
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

### RULES ###

/The [cC]urrent [vV]ersion/ && vers == "" \
{
  gsub(/[<>]/, " ");
  split($0, vers_a, " ");
  for (idx in vers_a)
  {
    if (vers_a[idx] ~ /[0-9]+\.[0-9]+/)
    {
      vers = vers_a[idx]
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
