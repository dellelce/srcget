#
# libxslt.latest.awk
#
# created: 070813
#

### MAIN LOOP ###

BEGIN {
        state = 0
        print ""
      }

# custom rules

/libxslt/ && $0 ~ ext && $0 !~ /-rc/ && /LATEST/ \
{
 latest = $9
}

## end rule ##

END   {
	 print "latest="latest
      }

## EOF ##
