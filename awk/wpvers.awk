#
# wpvers.awk
#
# created: 280713
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


function push_version(v)
{
  if (v ~ /.md5$/) return;
  if (v ~ /.sha1$/) return;
  if (v ~ /beta/) return;
  if (v ~ /-RC/) return;

  vn = substr(v, index(v,"wordpress-") + length("wordpress-"),length(v));
  sub(/.tar.gz/,"",vn);

  goodvn = compare_versions(goodvn,vn);
}


### MAIN LOOP ###

BEGIN {
        state = 0
        goodvn = "1.0.0"
        v = ""
      }

# custom rules

/wordpress-[1-9]/ && /tar.gz/ \
{
 gsub(/<tr/,"^"); 
 vline = $0
 v_cnt = split(vline, l_a, "^");

 for (i in l_a)
 {
   hline = l_a[i]
   hline_cnt = split(hline, hl_a, "'");

   for (hi in hl_a)
   {
     item = hl_a[hi]
     if (item ~ /tar.gz/ && item ~ /wordpress-/)
     {
       push_version(hl_a[hi]);
     }
   } 
 }
} 


### end loop ###

END   {
	# this is the end loop
        print "http://wordpress.org/wordpress-"goodvn".tar.gz"
      }
