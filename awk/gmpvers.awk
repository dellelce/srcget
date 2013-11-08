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
  split($5,vers_a,".");
  vers = vers_a[1] "." vers_a[2] "." vers_a[3]
}

### end loop ###

END   {
	print vers
      }
