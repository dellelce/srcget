#
# rubyvers.awk
#
# created: 0037 220713
#

### FUNCTIONS ###

### MAIN LOOP ###


/was released on/ { vers=$0  }


### end loop ###

END   {
        split(vers, vers_a, "<")
        split(vers_a[2], vers1_a, ">")
        print vers1_a[2]".tar.gz"
      }
