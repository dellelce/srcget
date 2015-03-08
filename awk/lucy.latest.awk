#
# lucy.latest.awk
#
# created: 2039 290314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/[0-9]+.[0-9]+.[0-9]+/ && /[lL]ucy/ && /[rR]elease/ && vers == "" \
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
