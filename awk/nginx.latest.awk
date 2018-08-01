#
# nginx.latest.awk
#
# created: 061013
#

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/[0-9]+\.[0-9]+\.[0-9]/ && /nginx-/ &&  vers == "" \
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
