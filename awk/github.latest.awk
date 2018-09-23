#
# github.latest.awk
#
# 280718 Created: meant to be a generic filter for github
#

### MAIN RULE ###

BEGIN \
{
  state = 0
  vers = ""
  print ""
}

# custom rules

state == 1 { next }

$0 ~ ext && /\/archive\// && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  cnt = split(line, line_a, " ");
  print "# DEBUG: cnt = " cnt " line = " line

  for (idx in line_a)
  {
    item = line_a[idx]
    print "# DEBUG: item = "item " idx = "idx

    if (item ~ ext)
    {
      vers = item
      print "# DEBUG: "vers " ext = "ext " idx = "idx

      if (vers ~ /-rc/)
      {
        print "# DEBUG: filter out rc"
        vers = ""
        next
      }

      if (vers ~ /beta/)
      {
        print "# DEBUG: filter out beta"
        vers = ""
        next
      }

      cnt = split (vers, vers_a, "/");

      vers = vers_a[cnt]
      state = 1; next
    }
  }
}

### END RULE ###

END \
{
  if (vers != "") print "latest="vers
}

### EOF ###
