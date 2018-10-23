#
# mongodb.latest.awk
#
# created: 260913
#

### FUNCTIONS ###

function dprint(msg)
{
  if (debug == 1) print "#DEBUG: "msg;
}

### MAIN LOOP ###

BEGIN {
        state = 0
        print ""
      }

# custom rules

$0 ~ ext && state == 0 \
{
  dprint("Production Release Found: " NR);
  line = $0
  gsub(/[()"]/," ",line);
  gsub(/&quot;/," ",line);
  split(line, vers_a, " ");

  for (idx in vers_a)
  {
    vers_i = vers_a[idx]

    if (vers_i ~ /[0-9]+\.[0-9]+\.[0-9]+/ && vers_i ~ ext)
    {
      vers = vers_i
      dprint("vers = "vers);
      state = 1
      next
    }
  }
  state = 1
  next;
}

### end loop ###

END \
{
  if (vers != "")
  {
    print "latest="vers;
  }
      }
