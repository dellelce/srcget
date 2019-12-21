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
        opt_match=ENVIRON["opt_match"]
        opt_nonmatch=ENVIRON["opt_nonmatch"]
      }

# custom rules

$0 ~ opt_match { state=1; }
opt_nonmatch != "" && $0 ~ opt_nonmatch { next; }

state == 1 && $0 ~ /[0-9]+\.[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>\/,=']/, " ", line);
  gsub(/&nbsp;/, " ", line);
  gsub(/\.html/, " ", line);
  cnt = split(line, line_a, " ");

  print "# DEBUG: line array cnt: " cnt
  print "# DEBUG: " line

  for (idx in line_a)
  {
    item = line_a[idx]
    print "# DEBUG: item = "item " index = "idx

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
  hyphen_cnt = split(vers, vers_a, "-"); if (hyphen_cnt == 2) vers = vers_a[2];
  sub(/\.$/, "", vers); #trailing dots not part of a version
  sub(/^v/, "", vers); #don't need an initial v

  if (vers != "")
  {
    print "latest="vers

    split(vers, vers_a, ".")
    print "major=\""vers_a[1]"\""
    print "minor=\""vers_a[2]"\""
  }
}
