#
# varnishvers.awk
#
# created: 1310 220314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

vers == "" && /[sS]table [rR]elease/ && /[0-9]+\.[0-9]+\.[0-9]+/ \
{
  gsub(/[-<>\"]/, " ", $0);
  vers_cnt = split($0, vers_a)
  for (item in vers_a)
  {
    if (vers_a[item] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      vers = vers_a[item]
    }
  }
  next
}

### END RULE ###

END   {
	print vers
      }
