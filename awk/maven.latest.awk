#
# maven.latest.awk
#
# created: 1129 280314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
        vers = ""
      }

# custom rules


/[0-9]+\.[0-9]+\.[0-9]+/ && vers == "" && $0 ~ ext && !/-bin/ \
{
  gsub(/[()"<>]/, " ");
  split($0, array, " ");

  for (idx in array)
  {
    item = array[idx]
    if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ && item ~ /http/)
    {
      vers = item
    }
  } 
}

### END RULE ###

END \
{
 if (vers != "") 
 {
   print vers
 }
}

## EOF ##
