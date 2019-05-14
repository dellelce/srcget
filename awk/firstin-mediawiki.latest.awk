#
# firstin-mediawiki.latest.awk
#
# created: 140519 
#
# pattern: first in body - customized for mediawiki

BEGIN {
        vers=""
        print ""
	state=0
      }

# custom rules

state == 0 && /mainpage-news/ { state = 1; next; }

state == 1 && $0 ~ /[0-9]+\.[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>]/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "# DEBUG: " line

  for (idx in line_a)
  {
    item = line_a[idx]

    # we expect a propepr version number to be after "MediaWiki" word
    if (state == 1 && item == "MediaWiki") { state = 2; continue; }

    if (state == 2 && item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      lightvers = vers

      if (vers ~ /\.sig/ || vers ~ /\.asc/) continue;

      sub("."ext, "", lightvers)
      lv_cnt = split(lightvers, lightvers_a, "-");
      print "# DEBUG: light vers:" lightvers
      print "# DEBUG: light vers base:" lightvers_a[lv_cnt-1]

      # this test is only if pkgbasse is set
      if (pkgbase != "")
      {
       base_cnt = split(lightvers_a[lv_cnt-1], base_a, "/")
       base = base_a[base_cnt]

       if (pkgbase !~ base)
       {
        print "# DEBUG: base test failed: base ="base
        vers=""
        next
       }
      }

      for (item_lv in lightvers_a)
      {
       lv_test = lightvers_a[item_lv]

       print "# DEBUG: testing lv item = "lv_test

       if (lv_test ~ /[0-9]+\.[0-9]+/)
       {
         lv = lv_test
         print "# DEBUG: version found: "lv
         next
       }
      }

      print "# DEBUG: version path found: "vers
      next
    }
  }
}

### end rule ###

END \
{
  print "# DEBUG: END FNR = " FNR
  if (lv != "")
  {
    print "version="lv
  }
  if (vers != "")
  {
    split(vers, vers_a, ".")
    base=vers_a[1]"."vers_a[2]
    print "latest="base"/mediawiki-"vers"."ext
  }
}
