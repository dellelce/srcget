#
# yajlvers.awk
#
# created: 1305 181013
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


### MAIN RULE ###

BEGIN {
        vers = "0.0.0"
        initial_vers = vers
        versurl = ""
      }

# custom rules

$2 ~ /[0-9]/ &&  $0 ~ ext \
{
  vers_cnt = split($2, vers_a, "/")

  vers_now = vers_a[vers_cnt]

  vers = compare_versions(vers, vers_now)


  if (vers == vers_now)
  {
    versurl=$2
  }
}

## END RULE ##

END   {
        if (initial_vers != vers)
        {
	  print vers
        }
      }

## EOF ##
