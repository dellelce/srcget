#
# githubjson-tags.latest.awk
#
# 291219 Created
#

## MAIN RULE ##

BEGIN \
{
  vers = ""
  print ""
}

{
  gsub(/[:,]/, " ");
  gsub(/["]/, " ", $1);
}

$1 ~ /name/ \
{ 
  print "#DEBUG: name: " $0
  name=$2

  if (vers == "")
  {
    print "#DEBUG: got version: " name
    vers = name
    sub(/^v/, "", vers)
    gsub(/_/, ".", vers)
    gsub(/"/, "", vers)
  }

  next
}

## END RULE ##

END \
{
  if (vers != "") print "latest="vers
}

## EOF ##
