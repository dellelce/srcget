#
# varnish.latest.awk
#
# created: 1310 220314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN \
{
 vers=""
}

# custom rules

/[0-9]+\.[0-9]+\.[0-9]+/ && vers == "" \
{
  gsub(/[-<>\"]/, " ", $0);
  vers_cnt = split($0, vers_a)
  for (item in vers_a)
  {
    if (vers == "" && vers_a[item] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      vers = vers_a[item]
    }
  }
  next
}

### END RULE ###

END \
{
 print vers
}
