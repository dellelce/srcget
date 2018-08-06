#
# kafka.latest.awk
#
# created: 020818
#

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

/^$/ { next }

!/latest release/ { other=$0; next; }

/latest release/ && $0 ~ /[0-9]+\.[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/[<>]/, " ", line);
  cnt = split(line, line_a, " ");

  print "# DEBUG: previous line: " other
  print "# DEBUG: ("cnt " tokens): " line

  for (idx in line_a)
  {
    item=line_a[idx]
    print "# DEBUG : iterating line: idx= " idx " item= "item
    if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ && !/\.$/)
    {
      sub(/\.$/,"",item)
      vers = item
      print "# DEBUG: version found: "vers
      next
    }
  }
}

### end loop ###

END   {
        if (vers != "")
        {
          print "latest="vers
        }
      }
