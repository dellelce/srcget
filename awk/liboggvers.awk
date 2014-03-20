#
# liboggvers.awk
#
# created: 0105 200314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

vers == "" && $0 ~ ext && /libogg-/ \
{
  vers = $2 
}

### END RULE ###

END   {
	print vers
      }
