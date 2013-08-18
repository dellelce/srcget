#
# zlibvers.awk
#
# created: 180813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

state == 0 && /Current release/ \
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
        gv_cnt = split(goodver, gv_a)
	goodver = gv_a[2]
        #ftp://ftp.simplesystems.org/pub/png/src/libpng16/libpng-1.6.3.tar.xz
        print "zlib-"goodver"."ext
      }
