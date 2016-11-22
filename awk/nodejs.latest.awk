#
# nodejs.latest.awk
#
# created: 0459 071013
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
       vers = ""
      }

# custom rules

$0 ~ ext && $0 ~ /[0-9]+\.[0-9]+\.[0-9]+/ && vers == "" \
{
 line = $0
 gsub(/["<>()]/, " ", line);
 split(line, vers_a, " ");

 for(idx in vers_a)
 {
  item = vers_a[idx]

  if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ && vers == "")
  {
    vers = item
  }
 }
}


### END RULE ###

#http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz

 END {
       if (vers!="")
       {
         print vers
       }
     }

## EOF ##
