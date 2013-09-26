#
# mongodbvers.awk
#
# created: 1258 260913
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/Production Release/ && state == 0 { state = 1; next; }

state == 1 && /[0-9]+\.[0-9]+\.[0-9]+/ { vers = $1; state = 2; next; }

state == 2 && $0 ~ ext \
{
   if (index($0, vers) > 0)
   {
     cnt = split($0, url_a, "'");
     fullurl = url_a[2]
   }
} 


### end loop ###

END   {
	if (fullurl != "") print fullurl;
      }
