#
# glibvers.awk
#
# created: 1722 100813
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

  return  "EQ"
}


### MAIN LOOP ###

BEGIN {
        good_vers = "1.0.0"
      }

# custom rules

$0 ~ ext \
{
  vers = $11
  sub(/glib-/,"",vers);
  split(vers,vers_a,".");
  vers = vers_a[1]"."vers_a[2]"."vers_a[3]

  # even versions only!
  even_check = vers_a[2]
  if (even_check % 2 == 1) next;

  good_vers = compare_versions(good_vers, vers)
}

### end loop ###

END   {
        split(good_vers,gv_a, ".")
        basename = gv_a[1]"."gv_a[2]
	print basename"/glib-"good_vers"."exturl
      }
