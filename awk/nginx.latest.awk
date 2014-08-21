#
# nginxvers.awk
#
# created: 0411 061013
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules


/[0-9]+\.[0-9]+\.[0-9]/ && vers == "" \
{
 line = $0
 gsub(/[<>,]/, " ", line);
 cnt = split(line,vers_a, " ");

 for (idx in vers_a)
 {
   if (vers_a[idx] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
   {
     vers = vers_a[idx]
   }
 }
 next
}

### end rule ###

END   {
	print vers
      }
