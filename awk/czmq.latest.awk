#
# czmq.latest.awk
#
# created: 1338 011014
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/[0-9]+.[0-9]+.[0-9]+/ && !/rc/ && vers == "" && $0 ~ ext \
{
  gsub(/[<>#]/," ");
  split($0, array, " ");

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
        if (vers != "") print vers;
      }
