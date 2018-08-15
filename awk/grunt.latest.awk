#
# grunt.latest.awk
#
# created: 160214
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /\/archive\// && !/_pr/ && vers == "" \
      {
        vers = $4

        cnt = split (vers, vers_a, "/");

        vers = vers_a[5]
      }

### END RULE ###

END   {
	# this is the end rule
        print vers
      }
