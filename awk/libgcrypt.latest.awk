#
# libgcryptvers.awk
#
# created: 090813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers = ""
      }

# custom rules

/tar\.bz2/ && !/\.sig/ \
{
  vers =  $2
} 

### end loop ###

END \
{
  print vers
}
## EOF ##
