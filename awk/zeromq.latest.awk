#
# zeromqvers.awk
#
# created: 0428 011213
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

vers == "" && $2 ~ ext \
{ vers = $2 } 

### END RULE ###

END   {
	print vers
      }
