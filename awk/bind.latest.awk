#
# bindvers.awk
#
# created: 1834 150614
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

$0 ~ ext && /bind/ && !/bind10/ && vers == "" \
{
 line = $0
 split(line, line_a, "\"");

 for (idx in line_a)
 {
   item = line_a[idx]

   if (item ~ ext && !/\.asc$/ && vers == "")
   {
     vers = item
     next
   }
 }

}

### END RULE ###

END   {
	if (vers != "") print vers;
      }
