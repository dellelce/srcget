#
# expat.latest.awk
#
# created: 310717 from swig?
#

### MAIN LOOP ###

BEGIN {
        vers = ""
        print ""
      }

# custom rules

$0 ~ /[0-9]+\.[0-9]+\.[0-9]+/ && /span/ && vers==""\
{
  line = $0;
  gsub(/[<>]/, " ", line); 
  split(line,a, " ");
  print "#DEBUG: "line

  for (x in a)
  {
    if (a[x] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      print "#DEBUG: version check: "a[x]
      if (a[x] ~ /^2\.1/) { vers=a[x]; next; }
    }
  } 
}

### end rule ###

END \
{
 if (vers != "")
 {
  #-3.0.12
  print "latest="vers"/expat-"vers
 }
}

## EOF ##
