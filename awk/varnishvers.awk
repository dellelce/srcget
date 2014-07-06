#
# varnishvers.awk
#
# created: 1310 220314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
        state = 0
      }

# custom rules

state == 0 && /[Ll]atest [rR]elease/ \
{
  state = 1;
  next
}

state == 1 && /[0-9]+\.[0-9]+\.[0-9]+/ && vers == "" \
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
