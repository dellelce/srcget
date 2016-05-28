#
# pkgconfig.latest.awk
#
# created: 050813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/pkg-config/ && /tar.gz/ && !/\.asc/ \
{
  ver = $8
}

### end loop ###

END \
{
  print ver
}

### EOF ###
