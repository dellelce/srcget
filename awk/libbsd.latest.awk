#
# libbsd.latest.awk
#
# 280813 Created
# 250718 Temporarily migrated to github
#

### MAIN RULE ###

BEGIN \
{
  vers = ""
}

# custom rules

$0 ~ ext && /\/archive\// && vers == "" \
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
