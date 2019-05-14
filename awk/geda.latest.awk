#
# geda.latest.awk
#
# created: 310718
#

### FUNCTIONS ###

function dprint(msg)
{
  if (debug == 1) print "#DEBUG: "msg;
}

### MAIN LOOP ###

BEGIN {
        print ""
        state = 0
      }

# custom rules

/stable/ && $0 ~ ext && state == 0 \
{
  line=$0
  gsub(/[<>"]/, " ", line);
  split(line, line_a, " ");

  for (idx in line_a)
  {
   item=line_a[idx]
   
   if (item ~ ext && /[0-9]+\.[0-9]+/)
   {
     latest=item
     dprint("found latest url: "latest)

     split(latest, latest_a, "/")
     for (lidx in latest_a)
     {
       litem = latest_a[lidx]
       dprint("looking for version in url: "litem)
       if (litem !~ /^v/ && litem ~ /[0-9]+\.[0-9]+\.[0-9]+/ && litem !~ ext)
       {
         version = litem
       }
     }
     state=1
     next
   }
  }
}

### end loop ###

END   {
	if (version != "") print "version="version
	if (latest != "") print "latest="latest
      }
