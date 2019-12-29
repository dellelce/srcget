#
# githubjson-releases.latest.awk
#
# 291219 Created
#

### MAIN RULE ###

BEGIN \
{
  state = 0
  vers = ""
  print ""
}

{
  gsub(/[:,]/, " ");
  gsub(/["]/, " ", $1);
}

$1 ~ /tag_name/ { print "#DEBUG: tag_name: " $0; tagname=$2; next; }
$1 ~ /draft/ { print "#DEBUG: draft: " $0; draft=$2; next; }
$1 ~ /prerelease/ { print "#DEBUG: prerelease: " $0; prerelease=$2; next; }
$1 ~ /tarball_url/ && vers == "" \
  {
    if (draft == "false" && prerelease == "false")
    {
      vers=tagname
      sub(/^v/, "", vers)
      gsub(/_/, ".", vers)
      gsub(/"/, "", vers)
    }
  }

### END RULE ###

END \
{
  if (vers != "") print "latest="vers
}

### EOF ###
