#
# bind.latest.awk
#
# created: 1834 150614
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
        state = 0
      }

# custom rules

/BIND Software Version/ && state == 0 { state = 1; } 

state == 1 && /[0-9]+\.[0-9]+\.[0-9]/ \
{
   line = $0
   gsub(/[<>]/, " ", line);
   split(line, line_a, " ");

   for (idx in line_a)
   {
     item = line_a[idx]
     if (vers == "" && item ~ /[0-9]+\.[0-9]+\.[0-9]/)
     {
       vers = item
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
  gsub(/\./, "-", vers);
  vers=tolower(vers)
  print vers;
 }
}
