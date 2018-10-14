#
# cmake.latest.awk
#
# created: 010413
#

### MAIN LOOP ###

BEGIN \
{
 pos = 0
 print ""
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
  #https://cmake.org/files/v3.12/cmake-3.12.0.tar.gz
  good_vers = vers_a[2]

  if (good_vers != "")
  {
    split(good_vers, gv_a, ".");
    gv_leading = gv_a[1]"."gv_a[2]

    print "version="good_vers
    print "latest="gv_leading"/cmake-"good_vers
  }
  
  
}
## EOF ##
