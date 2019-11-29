#
# bind.latest.awk
#
# created: 150614
#

### MAIN RULE ###

BEGIN {
        vers=""
        state = 0
        print ""
      }

$0 ~ ext && /[0-9]+\.[0-9]+\.[0-9]/ && vers == "" \
{
   line = $0
   gsub(/[<>]/, " ", line);
   split(line, line_a, " ");
   print "#DEBUG: version pattern match: "$0

   for (idx in line_a)
   {
     item = line_a[idx]
     if (vers == "" && item ~ /^BIND[0-9]+\.[0-9]+\.[0-9]/)
     {
       print "#DEBUG: version "item
       split(item, vers_a, ".");

       #ignore odd releases
       if (vers_a[2] % 2 != 1)
       {
         vers = item
       }
     }
   }

   state = 2
   next
}

### END RULE ###

END \
{
 if (vers != "")
 {
  sub(/BIND/, "", vers);
  sub("."ext, "", vers);
  print "latest="vers;
 }
}
