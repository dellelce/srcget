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
  vers = $2

  if (vers !~ /:\/\//)
  {
    vers = baseurl"/"vers
  } 
}

### END RULE ###

END   {
	print vers
      }
