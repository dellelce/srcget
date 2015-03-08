#
# openssl.latest.awk
#
# created: 0323 280813
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
        gvers = "0.0.0"
        initial_vers = gvers
      }

# custom rules

NR == 1 { extl="."ext; } 

#bad rule - won't work due to font tag, quick "simple" alternative
#$2 ~ ext && /openssl-[0-9]/ && !/beta/ && !/BOGUS/ \
$4 ~ ext && /LATEST/ \
{
  vers=$4
  sub(/openssl-/,"", vers);
  sub(extl, "", vers);

  gvers = compare_versions(gvers, vers)
}

### end rule ###

END   {
        if (gvers != initial_vers)
        {
	  print gvers
        }
      }
