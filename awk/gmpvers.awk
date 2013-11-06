#
# gmpvers.awk
#
# created: 0121 130813
#

### FUNCTIONS ###

function dprint(msg)
{
  if (debug == 1) print "DEBUG: "msg;
}

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/Release/ \
{
  dprint("Fullline "$0);
  print $4
}

### end loop ###

END   {
	# this is the end loop
      }
