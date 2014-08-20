#
# dbusvers.awk
#
# created: 1416 150414
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

$0 ~ ext && !/\.asc/ \
{
  gsub(/[<>]/, "\"");
  split($0, vers_a);

  for (item in vers_a)
  {
    if (vers_a[item] ~ ext)
    {
      vers = vers_a[item]
    }
  }
}


### END RULE ###

END   {
	print vers
      }

## EOF ##
