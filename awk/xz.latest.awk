#
# xzvers.awk
#
# created: 0602 110114
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        latest=""
      }

# custom rules

$2 ~ ext && $2 !~ /\.sig$/ && latest == "" { latest = $2 } 

### END RULE ###

END   {
	if (latest != "") { print latest; }
      }
