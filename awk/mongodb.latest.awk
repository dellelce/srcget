#
# mongodb.latest.awk
#
# created: 1258 260913
#

### FUNCTIONS ###

function dprint(msg)
{
  if (debug == 1) print "#DEBUG: "msg;
}


### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/Current Stable Release/ && state == 0 \
{
  dprint("Production Release Found: " NR);
  gsub(/[)"]/," ",$0);
  split($0, vers_a, " ");

  for (idx in vers_a)
  {
    vers_i = vers_a[idx]

    if (vers_i ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      vers = vers_i
      dprint("vers = "vers);
      state = 1
      next
    }
  }
  state = 1; # we should not reach this point - code to review
  next;
}

state == 1 && $0 ~ ext && /src/\
{
  if (index($0, vers) > 0)
  {
    cnt = split($0, url_a, "\"");
     
    for (idx in url_a)
    {
      url_i = url_a[idx]
      if (url_i ~ vers)
      {
       dprint("fullurl : "url_i)
       fullurl = url_i
       state = 2
       next
      }
    } 
  }
} 


### end loop ###

END   {
	if (fullurl != "")
        {
          sub(/https/, "http", fullurl);
          print fullurl;
        }
      }
