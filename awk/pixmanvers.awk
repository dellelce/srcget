#
# rubyvers.awk
#
# created: 0037 220713
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
        state = 0
        good_ver = "0.0.0"
      }

# custom rules

/pixman/ && /tar.gz/ \
{
  fn = $8
  if (fn ~ /\.sha1$/) { next; } 
  if (fn ~ /\.sha1\.asc$/) { next; } 

  ver = fn
  sub(/pixman-/,"",ver);
  sub(/\.tar\.gz/,"",ver);

  good_ver = compare_versions(good_ver, ver);
}

### end loop ###

END   {
	print "pixman-"good_ver".tar.gz"
      }
