#
# blender.latest.awk
#
# created: 070519
#

# pattern: last in body / customized for blender

### MAIN LOOP ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

$0 ~ /[0-9]+\.[0-9]+/ && $0 ~ ext && $0 !~ /\.md5sum/ && $0 !~ /[ab]\./ \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>]/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "# DEBUG: " line

  if (pkgprofile != "" && line !~ pkgprofile)
  {
   print "# DEBUG: filtering out line as missing pkgprofile="pkgprofile
   next
  }

  for (idx in line_a)
  {
    item=line_a[idx]
    if (item ~ ext && item ~ /[0-9]+\./ && item !~ /\.sig/ && $0 ~ !/\.asc/)
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
