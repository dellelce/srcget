#
# gromacs.latest.awk
#
# created: 140119
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

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  if (a_a[4] > b_a[4]) return a;
  if (a_a[4] < b_a[4]) return b;

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
        print ""
      }

# custom rules
$0 ~ ext && $0 ~ pkgprofile && !/\.sig/ && !/latest/ && !/beta/ && !/alpha/ && !/-rc/ && !/_patchset/ \
{
  if (customout != "" && $0 ~ customout)
  {
    next
  }
  gsub(/[<>"]/, " ", $0);
  cnt = split($0, a, " ");

  for (i in a)
  {
    if (a[i] ~ ext)
    {
      tmpvers=a[i]
      fullvers_temp = tmpvers
      sub("."ext, "", tmpvers)
      vers = get_pkg_version(tmpvers)
    }
  }

  good_vers = compare_versions(good_vers, vers);
  print("#DEBUG: good_vers="good_vers);
  print("#DEBUG: vers="vers);
  if (good_vers == vers)
  {
    fullvers = fullvers_temp
    print "#DEBUG: new fullvers: "fullvers_temp
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
