#
# php.latest.awk
#
# created: 310713
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        bn=""
	print ""
      }

# custom rules

/.tar./ \
{
  if (bn != "") next;
  bn = $2
  sub(/\/get\//,"", bn);
  sub(/\/from\/a\/mirror/, "", bn);
  bn = substr(bn, 1, index(bn, ".tar.")-1)
  sub(/php-/, "", bn);
} 

### end loop ###

END \
{
  gsub(/\/distributions\//,"",bn);
  print "latest="bn
}
## EOF ##
