#
# drupal.latest.awk
#
# created: 2205 090214
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        url=""
      }

# custom rules

# this is the first version let's keep it simple
!/-dev/  && $2 ~ ext && url == "" { url = $2; } 

### END RULE ###

END   {
	print url
      }
