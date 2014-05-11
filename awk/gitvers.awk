#
# cairovers.awk
#
# created: 290713
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  if (c_1 < 2 || c_2 < 2) { return "ERRINPUT"; }

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  return  a
}

### MAIN LOOP ###

BEGIN {
        state = 0
        good_ver = "1.0.0"
      }

# custom rules

$0 ~ ext &&/detail/&&/<td/&& /git-[0-9]/&&!/\.rc/ \
{
  v = $2
  v = substr(v, index(v, "-") + 1, length(v));
  v = substr(v, 1, index(v, ".tar.") - 1)
  good_ver = compare_versions(good_ver, v)
}

### end loop ###

END   {
 	print good_ver
      }
