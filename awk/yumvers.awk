#
# yumvers.awk
#
# created: 1849 010314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && vers == "" { vers = $2; }

### END RULE ###

END   {
	print vers
      }
