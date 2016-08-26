#
# perl.latest.awk
#
# created: 260816
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
        state = 0
      }

# custom rules


/stable version/ && /[0-9]+\.[0-9]+\.[0-9]/ \
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
     sub(/\.$/,"",vers);
   }
 }
  
 next
}

### END RULE ###

END \
{
 if (vers != "")
 {
  print vers;
 }
}

### EOF ###
