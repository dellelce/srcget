#
# networkx.latest.awk
#
# 310314 Created
# 230718 Migrated to github
#

### MAIN RULE ###

BEGIN \
{
  vers = ""
}

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]+a/ && $2 !~ /\.[0-9]+b/ && vers == "" \
{
  vers = $2

  cnt = split (vers, vers_a, "/");

  vers = vers_a[5]
}

### END RULE ###

END \
{
  print vers
}

### EOF ###
