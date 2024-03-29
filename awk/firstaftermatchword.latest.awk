#
# firstinmatchword.latest.awk
#
# created: 020619
#
# pattern: first after matchword

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
  gsub(/[<>,"']/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "#DEBUG: " line

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item

      print "#DEBUG: version path found: "vers
      next
    }
  }
}

### end rule ###

END \
{
  print "#DEBUG: END FNR = " FNR
  sub(/\.$/, "", vers); #trailing dots not part of a version
  if (vers != "")
  {
    print "latest="vers
  }
}
