#
# python2.latest.awk
#
# created: 220516
#

### MAIN RULE ###

BEGIN {
        vers=""
	state = 0
      }

# custom rules

state == 0 && $0 ~ /latest source release/ \
{
 state = 1
 next
}

state == 1 && $0 ~ /2\.[0-9]+\.[0-9]+/ && vers == "" \
{
 line = $0
 gsub(/[<>]/, " ", line);
 gsub(/"/, " ", line);
 split(line, vers_a, " ");

 for (idx in vers_a)
 {
   item = vers_a[idx];
   if (vers == "" && item ~ /[0-9]\.[0-9]+\.[0-9]+/)
   {
     vers = item
     state = 2
   }
 }
 next
}

### END RULE ###

END   {
        #http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tar.xz
        if (vers!="") # make sure we don't return junk
	{ 
          print vers
        }
      }
