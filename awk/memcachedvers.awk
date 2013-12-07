#
# memcachedvers.awk
#
# created: 1353 071213
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

$0 ~ ext && vers == "" { vers=$2; }

### END RULE ###

END   {
	print vers
      }
