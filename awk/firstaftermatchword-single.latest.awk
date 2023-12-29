#
# firstinmatchword-single.latest.awk
#
# created: 070619
#
# pattern: first after matchword

BEGIN {
        vers=""
        print ""
        state=0
        opt_match=ENVIRON["opt_match"]
      }

# custom rules

$0 ~ opt_match { state=1; }

state == 1 && $0 ~ /[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  gsub(/[<>/]/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "#DEBUG: " line

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /[0-9]+/)
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
  print "#DEBUG: END FNR = " FNR "; final state = "state
  sub(/\.$/, "", vers); #trailing dots not part of a version
  if (vers != "")
  {
    print "latest="vers
  }
}
