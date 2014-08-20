#
# libpngvers.awk
#
# created: 290713
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

state == 0 && /Current<BR>version/ \
{
  state = 1
  next
}

state > 0 && state < 5 \
{
  if (state == 3) { ver=$0; state = 4; next; } 
  state = state + 1
}

state == 4 { next }

### end loop ###

END   {
	ver_cnt = split(ver, ver_a, "<")
        ver_cnt = split(ver_a[3], ver_a1, ">");
        goodver = ver_a1[2]
        #ftp://ftp.simplesystems.org/pub/png/src/libpng16/libpng-1.6.3.tar.xz
        topver = substr(goodver,1,1)""substr(goodver,3,1)
        print "libpng"topver"/libpng-"goodver".tar.xz"
      }
