#
# mediawiki.latest.awk
#
# created: 300813
#

### MAIN LOOP ###

BEGIN {
        state = 0
        print ""
      }

# custom rules

state == 0 && /Current [vV]ersion/ \
{
  state = 1
  next
}

state == 1 && /Release notes/ \
{
  line = $0
  gsub(/\//," ",line);
  gsub(/\"/," ",line);
  gsub(/[_#]/," ",line);
  gsub(/[<>]/," ",line);

  split(line, vers_a, " ");
  print "# DEBUG : "line

  for (idx in vers_a)
  {
   item = vers_a[idx]

   if (item ~ /[0-9]+\.[0-9]+/)
   {
     vers = item
   }
  }
  state = 0
  next
}

### end loop ###

END   {
        # ugly workaround for: http://download.wikimedia.org/mediawiki/1.21/mediawiki-1.21.1.tar.gz
        if (vers != "")
        {
          vers_cnt = split(vers,vers_a,".");

          if (vers_cnt == 2) { vers=vers".0"; } # if minor missing consider it 0
          print "latest="vers_a[1]"."vers_a[2]"/mediawiki-"vers"."ext
        }
      }
