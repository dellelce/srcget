#
# clownfish.latest.awk
#
# created: 070914
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/[0-9]+.[0-9]+.[0-9]+/ && /[cC]lown[Ff]ish/ && /[rR]elease/ && vers == "" \
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
	 print vers
      }
