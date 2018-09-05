#
# cfengine.latest.awk
#
# created: 050918
#

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
        state = 0
      }

# custom rules

state == 0 && /Current releases/ { state = 1; next; }

state == 1 && $0 ~ /[0-9]+\.[0-9]+/ && $0 ~ ext  && vers == "" \
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
