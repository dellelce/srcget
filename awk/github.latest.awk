#
# github.latest.awk
#
# 280718 Created: meant to be a generic filter for github
#

### MAIN RULE ###

BEGIN \
{
  vers = ""
  print ""
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
  print "latest="vers
}

### EOF ###
