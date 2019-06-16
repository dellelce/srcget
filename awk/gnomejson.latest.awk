#
# gnomjson.latest.awk
#
# created: 160619
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  print "#DEBUG: compare_versions = a:"a " b:"b

  if (c_1 < 2 || c_2 < 2)
  {
    print "#DEBUG: compare_version: ERRINPUT c_1 = "c_1 " c_2 = "c_2
    return "compare_fail"
  }

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

### MAIN LOOP ###

# begin rule
BEGIN {
        good_vers = "0.0.0"
        initial_vers = good_vers
        print ""
      }

# custom rules
/LATEST/ \
{
  line=$0
  gsub(/[:,{}\"]/, " ", line);

  split(line, line_a);

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /LATEST-IS-/)
    {
      sub(/LATEST-IS-/, "", item);
      good_vers = compare_versions(item, good_vers)
    }
  } 
}

### end rule ###

END \
{
 if (initial_vers != good_vers)
 {
  split(good_vers, vers_a, ".")
  base_vers=vers_a[1]"."vers_a[2]
  print "version="good_vers
  print "latest="base_vers"/"pkgprofile"-"good_vers"."ext
 }
}

### EOF ###
