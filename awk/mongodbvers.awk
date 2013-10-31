#
# mongodbvers.awk
#
# created: 1258 260913
#

### FUNCTIONS ###

function dprint(msg)
{
  if (debug == 1) print "DEBUG: "msg;
}


### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/Production Release/ && state == 0 \
{
  dprint("Production Release Found: " NR);
  sub(/)/,"(",$0);
  split($0, vers_a, "(");
  dprint("vers_a[1] = "vers_a[1] " vers_a[2] = "vers_a[2]);
  vers = vers_a[2]
  state = 1;
  next;
}

state == 1 && $0 ~ ext && /src/\
{
   if (index($0, vers) > 0)
   {
     dprint("Version found: "$0);
     cnt = split($0, url_a, "\"");
     fullurl = url_a[2]
   }
} 


### end loop ###

END   {
	if (fullurl != "") print fullurl;
      }
