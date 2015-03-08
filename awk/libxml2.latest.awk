#
# libxml2.latest.awk
#
# created: 310713
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        line = ""
      }

# custom rules

/<[hH]3>/ \
{
  if (line=="") { line=$0; }
} 

### end loop ###

END \
{
 match_0 = "<h3>"
 pos = index(line, match_0)
 vers_0 = substr(line, length(match_0) + pos, length(line))
 split(vers_0, vers_a, ":")
 print vers_a[1]
}
## EOF ##
