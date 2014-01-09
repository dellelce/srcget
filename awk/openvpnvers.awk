#
# openvpnvers.awk
#
# created: 1814 090114
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

$0 ~ ext && $2 !~ /\.asc$/ \
     {
       if (vers=="") { vers = $2; }
     }


### END RULE ###

END   {
	print vers
      }
