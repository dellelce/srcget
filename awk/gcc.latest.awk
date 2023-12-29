#
# gcc.latest.awk
#
# created: 210713
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] == "" || b_a[3] == "") return a;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  return a
}

### MAIN LOOP ###

BEGIN \
{
  pos = 0
  gvers = "0.0.0"
  print ""
}

# custom rules
/released/ \
{
  line = $0

  gsub(/[<>"]/, " ", line);
  cnt = split (line, line_a, " ");
  print "#DEBUG: "line

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /[0-9]+\.[0-9]+/) { vers = item; }
  }

  if (vers == "") next;
  sub(/GCC /, "", vers);
  gvers = compare_versions(gvers, vers);
  next
}

### end loop ###

END \
{
 if (gvers != "")
 {
   cnt = split(gvers, gvers_a, ".");
   if (cnt == 2) gvers=gvers".0"

   print "version="gvers
   #gcc-4.8.1/gcc-
   print "latest=gcc-"gvers"/gcc-"gvers
 }
}

## EOF ##
