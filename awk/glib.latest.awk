#
# glib.latest.awk
#
# 100813 Created
# 220718 Recreated from czmq
#

### MAIN RULE ###

BEGIN \
{
  vers = ""
}

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]+a/ && $2 !~ /\.[0-9]+b/ && vers == "" \
{
  vers = $4

  cnt = split (vers, vers_a, "/");

  vers = vers_a[5]
}

### END RULE ###

END \
{
  print vers
}

### EOF ###
