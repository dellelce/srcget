#
# tclvers.awk
#
# created: 1129 160813
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
        goodvers = "1.0.0"
      }

# custom rules

$0 ~ exturl && /tcl[0-9]/ \
{
  v_cnt = split($5, v_a, "-")

  vers = v_a[1]
  sub(/tcl/,"",vers);
  goodvers = compare_versions(goodvers, vers);
} 

### end loop ###

END   {
	gv_cnt = split(goodvers, gv_a, ".");
	print gv_a[1]"_"gv_a[2]"/tcl"goodvers
      }
