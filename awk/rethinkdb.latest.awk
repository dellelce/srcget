#
# rethinkdb.latest.awk
#
# created: 040314
#

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]a/ && !/python/ && !/windows/ && !/BETA/ && !/RC/ && vers == "" \
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
