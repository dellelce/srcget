#
# firstinmatchword-trim.latest.awk
#
# created: 170619
#
# pattern: first after matchword with "extra trim"

BEGIN {
        vers=""
        print ""
        state=0
        substate=0
        opt_match=ENVIRON["opt_match"]
        opt_2ndmatch=ENVIRON["opt_2ndmatch"]
        opt_nonmatch=ENVIRON["opt_nonmatch"]
      }

# custom rules

$0 ~ opt_match \
{
  if (state != 1)
  {
    print "# DEBUG: change state from " state " to 1; LINE = " FNR; state=1;
  }
}
opt_nonmatch != "" && $0 ~ opt_nonmatch { next; }

state == 1 && $0 ~ /[0-9]+\.[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>\/,=']/, " ", line);
  gsub(/&nbsp;/, " ", line);

  # The next few lines are a bit kludgy
  #  and should be replaced by an array in the profile
  gsub(/\.html/, " ", line);
  gsub(/\.json/, " ", line);
  gsub(/\.asc/, " ", line);
  gsub(/\.sha/, " ", line);
  gsub(/\.txt/, " ", line);
  gsub(/\.pdf/, " ", line);
  gsub(/\.zip/, " ", line);
  cnt = split(line, line_a, " ");

  print "# DEBUG: line array cnt: " cnt
  print "# DEBUG: " line

  # no "2nd keyword" to match: change substate to 1
  if (opt_2ndmatch == "") { print "# DEBUG: opt_2ndmatch is empty."; substate = 1; }

  for (idx in line_a)
  {
    item = line_a[idx]
    print "# DEBUG: item = "item " index = "idx
    if (opt_2ndmatch != "" && substate == 0)
    {
      if  (item ~ opt_2ndmatch)
      {
        print "# DEBUG: 2nd keyword matched: LINE = " FNR " keyword = " item
        substate = 1
      }
      else
      {
        continue;  # we need substate == 1 to allow match of main keyword
      }
    }

    if (item ~ /[0-9]+\.[0-9]+/ && vers == "")
    {
      vers = item

      print "# DEBUG: version path found: "vers
      next
    }
  }
}

### end rule ###

END \
{
  print "# DEBUG: END FNR = " FNR

  #extra trim: remove extension
  sub("."ext,"",vers);
  print "# DEBUG: version after extension trim: "vers

  # remove "name-" prefix
  gsub(/_/, "-", vers)
  cnt = split(vers, vers_a, "-");
  nvers = ""

  for (idx in vers_a)
  {
    item = vers_a[idx]

    if (item ~ /[0-9]+\.[0-9]+/ && nvers == "")
    {
      nvers = item
    }
  }
  if (vers != nvers) print "# DEBUG: version after extra sanity check: "nvers
  vers = nvers

  sub(/\.$/, "", vers); #trailing dots not part of a version
  sub(/:/, "", vers); # unneeded character in version
  sub(/^v/, "", vers); #don't need an initial v
  gsub(/[()]/, "", vers); # not part of version

  if (vers != "")
  {
    print "latest="vers

    split(vers, vers_a, ".")
    print "major=\""vers_a[1]"\""
    print "minor=\""vers_a[2]"\""
  }
}
