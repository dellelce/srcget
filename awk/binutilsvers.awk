#
# binutilsvers.awk
#
# created: 210713
#

### FUNCTIONS ###

# we don't need this at binutils site is already oredered.
function getVersion(fn)
{
  sub(/binutils-/,"",fn);
  sub(/\.tar\.bz2/,"",fn);

  return fn;
}

### MAIN LOOP ###

# begin rule

BEGIN {
          max = ""
      }


# custom rules

/binutils/&&/\.bz2/ \
{ 
  cnt = split($0, outArray, "\"");

  if (cnt != 7) next; # ignore all lines that do not match our "format" 

  fn = outArray[6]

  if (fn !~ /tar\.bz2$/) { next; }  # ignore all .sig and possibly other files

  max = fn
}

### end loop ###

END   {
	print max
      }
