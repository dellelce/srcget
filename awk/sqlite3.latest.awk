#
# sqlite3.latest.awk
#
# created: 0455 221013
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
      }

# custom rules

 $0 ~ ext && /sqlite-autoconf/ && /d391/ { vers = $4 } 

### END RULE ###

END   {
	print vers
      }
