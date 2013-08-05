#
# cmakevers.awk
#
# created: 010413
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        pos = 0
      }

# custom rules

/Latest Release/ \
{
  line = $0
} 

### end loop ###

END \
{
  line_cnt = split(line, line_a)
  
  for (i in line_a)
  {
    if (line_a[i] ~ /[0-9]+\.[0-9]+\.[0-9]+/) { vers = line_a[i] }
  }

  sub(/\(/, ")", vers);
  split(vers, vers_a, ")")
  #http://www.cmake.org/files/v2.8/cmake-2.8.11.2.tar.gz
  good_vers = vers_a[2]
  print substr(good_vers,1,3)"/cmake-"good_vers
  
  
}
## EOF ##
