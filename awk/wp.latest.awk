#
# wp.latest.awk
#
# created: 280713
#

### MAIN LOOP ###

BEGIN {
        state = 0
        goodvn = "1.0.0"
        initialvn = goodvn
        vers = ""
      }

# custom rules

/Latest release/ && state == 0 { state = 1; next; }

$0 ~ ext && vers == "" && state == 1 \
{
 vline = $0
 gsub(/"/," ", vline);
 gsub(/[<>']/," ", vline);

 v_cnt = split(vline, l_a, " ");

 for (i in l_a)
 {
   cur = l_a[i]

   if(cur ~ ext && cur ~ /[0-9]\.[0-9]/ && cur !~ /\.md5$/ && cur !~ /\.sha1$/)
   {
    vers= cur
   } 
 }
} 


### end loop ###

END   {
        if (vers != "")
        {
          print vers
        }
      }

### EOF ###
