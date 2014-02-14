#
# opencvvers.awk
#
# created: 140214 cloned from libeventvers.awk
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
        state = 0
      }

# custom rules

state == 0 && /[Ll]atest [Rr]elease/ \
{
  state = 1
}

state == 1 && $2 ~ ext && /\/archive\// && !/-ocl-/ && vers == "" \
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
