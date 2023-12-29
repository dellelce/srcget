#
# generic-with-compare.latest.awk
#
# created: 010719
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

### MAIN ###

# begin rule
BEGIN {
        good_vers = "0.0.0"
        initial_vers = good_vers
        opt_match=ENVIRON["opt_match"]
        print ""
      }

# custom rules
$0 ~ ext && $0 !~ /\.sha256/ \
{
  line=$0

  #filter out lines that don't have "opt_match"
  if (opt_match != "")
  {
    if ($0 !~ opt_match)
    {
      print("#DEBUG: No opt_match: "$0)
      next
    }
  }

  print "#DEBUG: line: " line
  gsub(/[-<>:,{}\"]/, " ", line)
  split(line, line_a, " ")

  for (idx in line_a)
  {
    item = line_a[idx]
    print "#DEBUG: " item

    if (item ~ /[0-9]+\.[0-9]+/)
    {
      sub("."ext, "", item);
      good_vers = compare_versions(item, good_vers)
    }
  } 
}

### end rule ###

END \
{
 if (initial_vers != good_vers)
 {
  print "version="good_vers
  print "latest="good_vers
 }
}

### EOF ###
