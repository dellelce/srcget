#
# cgal.latest.awk
#
# created: 140519
# based on gnu filter
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  print "#DEBUG: compare_versions = a:"a " b:"b

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (c_1 == 3 || c_2 == 3)
  {
    if (a_a[3] > b_a[3]) return a;
    if (a_a[3] < b_a[3]) return b;
  }

  return a
}

function get_pkg_version(name)
{
 cnt = split(name, name_a, "[.-]")
 v = ""
 idx = 1

 while(idx <= cnt)
 {
  i = name_a[idx]

  if (i ~ /[0-9]+/)
  {
   if (v == "") { v = i; idx += 1; continue; }
   v=v"."i
  }
  idx += 1
 }

 return v
}

### MAIN LOOP ###

# begin rule
BEGIN {
        good_vers = "0.0.0"
        initial_vers = good_vers
	state = 0
        print ""
      }

# custom rules
/[0-9]+\.[0-9]+/ && !/beta/ \
{
  gsub(/[<>"]/, " ", $0);
  cnt = split($0, a, " ");
  print "#DEBUG" $0

  for (i in a)
  {
    if (state == 0 && a[i] == "CGAL") { state = 1; continue; }
    if (state == 1 && a[i] ~ /[0-9]+.[0-9]+/)
    {
      vers=a[i]
      good_vers = compare_versions(good_vers, vers);
      print("#DEBUG: good_vers="good_vers);
      print("#DEBUG: vers="vers);
      state = 0 

      if (good_vers == vers)
      {
        fullvers = vers
        print "#DEBUG: new fullvers: "fullvers
      }
    }
  }

}

### end rule ###

END \
{
 if (initial_vers != good_vers)
 {
  print "version="good_vers
  print "latest="fullvers
 }
}

### EOF ###
