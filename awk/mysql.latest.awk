#
# mysql.latest.awk
#
# created: 010813
#

### MAIN LOOP ###

BEGIN {
        state = 0
        print ""
      }

# custom rules

/^$/ { next }

state == 0 && /MySQL Community Server/ \
{
 state = 1
 next
}

state == 1 && !/Current Generally Available Release/ \
{
  state = 0
  next
}

state == 1 && /Current Generally Available Release/ \
{
  line = $0
  next
}

### end rule ###
END \
{
  if (line != "")
  {
    cnt = split(line, a)

    for (i in a)
    {
      if (a[i] ~ /[0-9]\.[0-9]+\.[0-9]+/) { vers = a[i] }
    }
    vers_cnt = split(vers,vers_a, ")");
    #http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.13.tar.gz/from/http://cdn.mysql.com/
    gvers = vers_a[1]
    print "#DEBUG: gvers = "gvers
    print "latest="substr(gvers,1,3)"/mysql-"gvers
  }
}

## EOF ##
