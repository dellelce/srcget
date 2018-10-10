#
# firstinbody.latest.awk
#
# created: 200918
#

# pattern: first in body

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ /[0-9]+\.[0-9]+/ && $0 ~ ext && vers == "" && $0 !~ /\.sig/ && $0 !~ /\.asc/ \
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

    if (item ~ ext && item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      lightvers=vers

      sub("."ext, "", lightvers)
      split(lightvers, lightvers_a, "-");
      print "# DEBUG: light vers:" lightvers

      for (item_lv in lightvers_a)
      {
       lv_test = lightvers_a[item_lv]

       print "# DEBUG: testing lv item = "lv_test

       if (lv_test ~ /[0-9]+\.[0-9]+/)
       {
         lv = lv_test
         print "# DEBUG: version found: "lv
       }
      }

      print "# DEBUG: version path found: "vers
      next
    }
  }
}

### end loop ###

END \
{
  if (lv != "")
  {
    print "version="lv
  }
  if (vers != "")
  {
    print "latest="vers
  }
}
