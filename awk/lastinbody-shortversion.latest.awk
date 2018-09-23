#
# lastinbody-shortversion.latest.awk
#
# created: 230918
#

# pattern: last in body - unusual "short version" variant

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ /[0-9]+/ && $0 ~ ext && $0 !~ /\.sig/ && $0 !~ /\.asc/ \
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
    if (item ~ ext && item ~ /[0-9]+/ && item !~ /\.sig/ && $0 ~ !/\.asc/)
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
