#
# editline.latest.awk
#
# created: 040813
#

### MAIN LOOP ###

BEGIN \
{
 state = 0
 print ""
}

# custom rules
state == 0 && /[dD]ownload/  { state = 1 }

state == 1 && $0 !~ ext { next }

state == 1 && $0 ~ ext { vers = $2 }

### end loop ###

END \
{
 if (vers!="") print "latest="vers
}

## EOF ##
