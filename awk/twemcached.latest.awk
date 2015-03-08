#
# twemcached.latest.awk
#
# created: 1428 071213
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

#https://github.com/twitter/twemcache/releases

$0 ~ ext && /\/archive\// && vers == "" \
      {
        vers = $2

        cnt = split (vers, vers_a, "/");

        vers = vers_a[5]
      }

### END RULE ###

END   {
	# this is the end rule
        print vers
      }
