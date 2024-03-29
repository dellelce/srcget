#
# lzip.latest.awk
#
# created: 020818
#

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ /[0-9]+\.[0-9]+/ && $0 ~ ext && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>]/, " ", line);
  split(line, line_a, " ");

  print "#DEBUG: " line

  for (idx in line_a)
  {
    item=line_a[idx]
    if (item ~ ext && item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      print "#DEBUG: version found: "vers
      next
    }
  }
}

### end loop ###

END \
{
  if (vers != "")
  {
    print "latest="vers
  }
}
