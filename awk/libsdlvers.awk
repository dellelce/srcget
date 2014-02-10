#
# libsdlvers.awk
#
# created: 0747 100214
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        fn = ""
      }

# custom rules

$8 ~ ext && !/-devel-/ && /SDL2-/ && !/mingw/ && $8 !~ /\.sig$/ { fn  = $8; }  

### END RULE ###

END   {
	print fn;
      }
