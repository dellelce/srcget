#
# libresslers.awk
#
# created: 250714
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  cnt1 = split(a, a_a, ".");
  cnt2 = split(b, b_a, ".");

  if (cnt1 < 2 || cnt2 < 2) { return "ERRINPUT c_1 = "cnt1 " c_2 = "cnt2 " a = " a " b = " b; }

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  if (a_a[4] > b_a[4]) return a;
  if (a_a[4] < b_a[4]) return b;

  return  "EQ"
}

### MAIN LOOP ###

# begin rule

BEGIN {
          good_vers = "0.0.0"
	  initial_vers = good_vers
      }


# custom rules

/libressl/&& !/latest/ && $0 ~ ext && !/\.sig/ \
{ 
  vers = $6
  sub(/libressl-/,"",vers)
  vers = substr(vers,1,index(vers,ext)-2)

  good_vers = compare_versions(good_vers, vers);
}

### end loop ###

END   {
        if (good_vers != initial_vers)
        {
	  print "libressl-"good_vers"."ext
        }
      }
