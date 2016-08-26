#
# perl.latest.awk
#
# created: 260816
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

  if (a_a[4] > b_a[4]) return a;
  if (a_a[4] < b_a[4]) return b;

  return  "EQ"
}

### MAIN RULE ###

BEGIN {
        vers="0.0.0"
        state = 0
      }

# custom rules


/stable version/ && /[0-9]+\.[0-9]+\.[0-9]/ \
{
 line = $0
 gsub(/[<>]/, " ", line);
 split(line, line_a, " ");

 for (idx in line_a)
 {
   item = line_a[idx]
   if (item ~ /[0-9]+\.[0-9]+\.[0-9]/)
   {
     vers = compare_versions(vers, item)
     sub(/\.$/,"",vers);
   }
 }
  
 next
}

### END RULE ###

END \
{
 if (vers != "")
 {
  print vers;
 }
}

### EOF ###
