#
# libxsltvers.awk
#
# created: 1721 070813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/libxslt/&&/tar.gz/&& /LATEST/ { latest = $9 } 

### end loop ###

END   {
	 print latest
      }
