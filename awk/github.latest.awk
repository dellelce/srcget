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

# "new style" from home page
state == 0 && /Link--primary/ && /\/releases\// \
{
  # we are on the home page and we found the latest release
  print "#DEBUG: new version on home page: " $0
  print "#DEBUG: new version on home page: line = " FNR
}

# try to filter out "Pre-release"s; this needs to introduce "multi-page" github traversal
/Pre-release/ \
{
  state = 2
  print "#DEBUG: skipped Pre-release: " FNR
  print "#DEBUG: line: " $0
  next
}

state == 2 && /Latest/ \
{
  state = 0
  print "#DEBUG: found Latest: " NR
  next
}

opt_nonmatch != "" && $0 ~ opt_nonmatch { next; }

# "new" style
state == 0 && /Link--primary/ \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>]/, " ", line);
  print("#DEBUG: line after gsub: ", line);
  cnt = split(line, line_a, " ");
  print "#DEBUG: link-primary line: " NR

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item  ~ /[0-9]\./) # removed "tag" check here: why was it here?
    {
      print "#DEBUG: link-primary: "item
      item_cnt = split(item, item_a, "/")

      cand_vers = item_a[item_cnt]
      print "#DEBUG: tag = " cand_vers
      sub(/^v/, "", cand_vers)

      if (cand_vers ~ /-rc/ || cand_vers ~ /beta/ || cand_vers ~ /alpha/)
      {
         print "#DEBUG: tag skipped."
         continue
      }

      if (cand_vers  ~ /[0-9]\./)
      {
         if (cand_vers ~ /-/)
         {
            print("#DEBUG: cand_vers hyphen check: " cand_vers)
            cv_cnt = split(cand_vers, cv_a, "-")

            for (pos = 1; pos <= cv_cnt; pos += 1)
            {
               cv_item = cv_a[pos]
               print("#DEBUG: cand_vers hyphen loop: " cv_item)

               if (cv_item ~ /[0-9]\./)
               {
                 cand_vers = cv_item;
                 print("#DEBUG: cand_vers after hyphen check: " cand_vers)
               }
            }
         }

         # candidate version passed checks
         vers = cand_vers
         state = 1
      }
    }
 }
}

# "old" style
state == 0 && $0 ~ ext && $0 ~ /[0-9]\./ && /\/archive\// && $0 !~ /-windows/ && $0 !~ /-dev/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>]/, " ", line);
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
  if (vers != "") print "latest="vers
}

### EOF ###
