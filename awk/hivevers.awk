#
# hivevers.awk
#
# created: 1355 270314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

/release/&&/available/&&/[0-9]+.[0-9]+.[0-9]+/&&vers=="" \
{
  gsub(/[<>]/," ");
  split($0, array);

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
         print vers"/hive-"vers
        }
      }
