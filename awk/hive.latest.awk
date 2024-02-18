#
# hive.latest.awk
#
# created: 270314
#

### MAIN RULE ###

BEGIN {
        vers=""
        print ""
      }

# custom rules

/release/&&/available/&&/[0-9]+.[0-9]+.[0-9]+/&&vers=="" \
{
  if ($0 ~ /alpha/ || $0 ~ /beta/) next;

  gsub(/[\/<>]/," ");
  split($0, array);

  print "#DEBUG: found = "$0

  for (item in array)
  {
    if (array[item] ~ /[0-9]+.[0-9]+.[0-9]+/)
    {
      vers = array[item]
    }
  }
}

### END RULE ###

END   {
	#0.12.0/hive-0.12.0  ... I don't like the following lines ...
	if (vers != "")
        {
         print "latest="vers
        }
      }
