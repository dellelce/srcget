#
# boost.latest.awk
#
# created: 231018
#


### MAIN LOOP ###

BEGIN {
        state=0
        vers=""
        print ""
      }

# custom rules

state==0 && /Current Release/ \
{
  state = 1
  next
}

state == 1 && $0 ~ /[0-9]+\.[0-9]+/ && vers == "" \
{
  line=$0
  gsub(/\"/, " ", line);
  gsub(/[<>\/]/, " ", line);
  gsub(/&nbsp;/, " ", line);
  split(line, line_a, " ");

  print "# DEBUG: " line

  for (idx in line_a)
  {
    item=line_a[idx]

    if (item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      print "# DEBUG: version path found: "vers
      next
    }
  }
}

### end loop ###

END \
{
  if (vers != "")
  {
    print "version="vers
    # https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
    vers_u=vers
    gsub(/\./,"_",vers_u);
    print "latest="vers"/source/boost_"vers_u
  }
}
