#
# wp.latest.awk
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

  return "EQ"
}


function push_version(v)
{
  if (v ~ /beta/) return;
  if (v ~ /-RC/) return;

  vn = substr(v, index(v,"wordpress-") + length("wordpress-"),length(v));
  sub(ext,"",vn);
  sub(/\.$/,"",vn);

  goodvn = compare_versions(goodvn,vn);
}


### MAIN LOOP ###

BEGIN {
        state = 0
        goodvn = "1.0.0"
        initialvn = goodvn
        vers = ""
      }

# custom rules

/Betas and Release Candidates/ && state == 0 { state = 1; next; }

$0 ~ ext && vers == "" && state == 0 \
{
 vline = $0
 gsub(/[<>']/," ", vline);

 v_cnt = split(vline, l_a, " ");

 for (i in l_a)
 {
   cur = l_a[i]

   if(cur ~ ext && cur ~ /[0-9]\.[0-9]/ && cur !~ /\.md5$/ && cur !~ /\.sha1$/)
   {
     push_version(cur)
   } 
 }
} 


### end loop ###

END   {
	# this is the end loop
        if (goodvn != initialvn)
        {
          print "http://wordpress.org/wordpress-"goodvn".tar.gz"
        }
      }

### EOF ###
