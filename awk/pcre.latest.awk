#
# pcrevers.awk
#
# created: 0133 301213
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$2 ~ ext && $2 !~ /\.sig$/ \
{
#  cnt = split($2, a, "/");

#  vers = a[8]
  vers = $2
# future release
#  sub(ext, "", vers)
#  sub(/\.$/, "", vers)
#  sub(/^pcre-/, "", vers)
}

### END RULE ###

END   {
	print vers
      }
