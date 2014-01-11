#
# xzvers.awk
#
# created: 0602 110114
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
      }

# custom rules

$2 ~ ext && $2 !~ /\.sig$/ { print $2 } 

### END RULE ###

END   {
	# this is the end rule
      }
