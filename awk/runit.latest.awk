#
# runit.latest.awk
#
# created: 190918
#

# pattern: first in body

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ /[0-9]+\.[0-9]+/ && $0 ~ ext && vers == "" && $0 ~ !/\.sig/ \
{
  line=$0
  gsub(/\"/, " ", line);
  gsub(/[<>]/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "# DEBUG: " line

  for (idx in line_a)
  {
    item=line_a[idx]
    if (item ~ ext && item ~ /[0-9]+\.[0-9]+/ && item !~ /\.sig/)
    {
      vers = item
      print "# DEBUG: version found: "vers
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
