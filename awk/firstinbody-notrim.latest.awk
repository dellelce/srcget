#
# firstinbody.latest.awk
#
# created: 200918
#
# pattern: first in body

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
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "#DEBUG: " ine

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ ext && item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      lightvers = vers

      if (vers ~ /\.sig/ || vers ~ /\.asc/ || vers ~ /alpha/)  { print "#DEBUG: skipped: "vers; vers=""; continue; }

      sub("."ext, "", lightvers)
      lv_cnt = split(lightvers, lightvers_a, "-");
      print "#DEBUG: light vers:" lightvers
      print "#DEBUG: light vers base:" lightvers_a[lv_cnt-1]

      # this test is only if pkgbasse is set
      if (pkgbase != "")
      {
       base_cnt = split(lightvers_a[lv_cnt-1], base_a, "/")
       base = base_a[base_cnt]

       if (pkgbase !~ base)
       {
        print "#DEBUG: base test failed: base ="base
        vers=""
        next
       }
      }

      for (item_lv in lightvers_a)
      {
       lv_test = lightvers_a[item_lv]

       print "#DEBUG: testing lv item = "lv_test

       if (lv_test ~ /[0-9]+\.[0-9]+/)
       {
         lv = lv_test
         print "#DEBUG: version found: "lv
         next
       }
      }

      print "#DEBUG: version path found: "vers
      next
    }
  } # for
}

### end rule ###

END \
{
  print "#DEBUG: END FNR = " FNR
  if (lv != "")
  {
    print "version="lv
  }
  if (vers != "")
  {
    print "latest="vers
  }
}
