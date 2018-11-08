#
# cabal.latest.awk
#
# created: 290314
#

### MAIN RULE ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ ext && /cabal-[0-9]+\.[0-9]+\.[0-9]/ && vers == "" \
{
  gsub(/[<>\"]/, " ");
  c = split($0, a, " ");
  print "# DEBUG: " $0

  for (idx in a)
  {
    item = a[idx]
    if (item ~ ext)
    {
      vers=item
      next
    }
  }
}

### END RULE ###

END   {
	if (vers != "")
        {
          print "latest="vers
        }
      }
