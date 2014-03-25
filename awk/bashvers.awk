#
# bashers.awk
#
# created: 220314
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  if (c_1 < 2 || c_2 < 2) { return "ERRINPUT c_1 = "c_1 " c_2 = "c_2; }

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  return  "EQ"
}

### MAIN LOOP ###

# begin rule

BEGIN {
          good_vers = "0.0.0"
          initial_vers = good_vers
      }


# custom rules

/bash/&& !/bash-doc/ && $0 ~ ext && !/\.sig/ \
{ 
  vers = $6
  sub(/bash-/,"",vers)
  vers = substr(vers,1,index(vers,ext)-2)

  good_vers = compare_versions(good_vers, vers);
}

### end loop ###

END   {
        if (initial_vers != good_vers)
        {
	 print good_vers
        }
      }
