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
  opt_nonmatch=ENVIRON["opt_nonmatch"]
  print ""
}

# custom rules

state == 1 { next } # found our "release" skip everything else

# try to filter out "Pre-release"s; this needs to introduce "multi-page" github traversal
/Pre-release/ \
{
  state = 2
  print "#DEBUG: skipped Pre-release"
  next
}

state == 2 && /Latest release/ \
{
  state = 0
  print "#DEBUG: found Latest"
  next
}

opt_nonmatch != "" && $0 ~ opt_nonmatch { next; }

state == 0 && $0 ~ ext && $0 ~ /[0-9]\./ && /\/archive\// && $0 !~ /-windows/ && $0 !~ /-dev/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  cnt = split(line, line_a, " ");
  print "# DEBUG: state = " state " cnt = " cnt " line = " line

  for (idx in line_a)
  {
    item = line_a[idx]
    print "# DEBUG: item = "item " idx = "idx

    #
    if (cnt == 8 && /systemd/)
    {
      print "#DEBUG: temp fix to systemd tag with slash"
      next
    }

    if (item ~ ext)
    {
      vers = item
      print "# DEBUG: "vers " ext = "ext " idx = "idx

      if (vers ~ /-alpha/)
      {
        print "# DEBUG: filter out alphas!"
        vers = ""
        next
      }

      if (vers ~ /-rc/ || vers ~ /RC/)
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
