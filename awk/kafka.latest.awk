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

/latest release/ && $0 ~ /[0-9]\.[0-9]/ && vers == "" \
{
  line=$0
  gsub(/[<>]/, " ", line);
  split(line, line_a, " ");

  print "# DEBUG: " line

  for (idx in line_a)
  {
    item=line_a[idx]
    if (item ~ /[0-9]\.[0-9]\.[0-9]+/ && !/\.$/)
    {
      vers = item
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
