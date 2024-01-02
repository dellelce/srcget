#
# github.latest.awk
#
# 280718 Created: meant to be a generic filter for github
# 260922 Custom github filter for curl, to be merged with main stream
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

state == 0 && /Link--primary/ \
{
  line = $0;
  gsub(/[<>]/, " ", line)

  line_cnt = split(line, line_a, " ")
  print "#DEBUG: link--primary: " line
  print "#DEBUG: link_cnt: " line_cnt

  for (line_pos = 1; line_pos <= line_cnt; line_pos += 1)
  {
    v = line_a[line_pos]
    print "#DBEUG: lp: word check = " v

    if (v ~ /[0-9]+\.[0-9]+/) { print "#DEBUG: vers through Link-primary:" vers; vers = v; state = 1; next; } 
  }
}

# try to filter out "Pre-release"s; this needs to introduce "multi-page" github traversal
/Pre-release/ \
{
  state = 2
  print "#DEBUG: skipped Pre-release"
  next
}

state == 2 && /Latest/ \
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
  print "#DEBUG: state = " state " cnt = " cnt " line = " line

  for (idx in line_a)
  {
    item = line_a[idx]
    print "#DEBUG: item = "item " idx = "idx

    #
    if (cnt == 8 && /systemd/)
    {
      print "#DEBUG: temp fix to systemd tag with slash"
      next
    }

    if (item ~ ext)
    {
      vers = item
      print "#DEBUG: "vers " ext = "ext " idx = "idx

      if (vers ~ /-alpha/)
      {
        print "#DEBUG: filter out alphas!"
        vers = ""
        next
      }

      if (vers ~ /-rc/ || vers ~ /RC/)
      {
        print "#DEBUG: filter out rc"
        vers = ""
        next
      }

      if (vers ~ /beta/)
      {
        print "#DEBUG: filter out beta"
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
  print "#END"
  if (vers != "") print "latest="vers
}

### EOF ###
