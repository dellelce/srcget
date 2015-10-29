#
# czmq.latest.awk
#
# created: 1338 011014
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN \
{
  vers = ""
}

# custom rules

#/[0-9]+.[0-9]+.[0-9]+/ && !/rc/ && vers == "" && $0 ~ ext \
# !/rc/ && vers == "" && $0 ~ ext \

$0 ~ ext && !/-rc/ && !/beta/ && /zeromq/ && !/alpha/ \
{
  gsub(/[<>#]/," ");
  split($0, array, " ");

  for (idx in array)
  {
    item = array[idx]

    if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      vers = item
    }
  }
}


### END RULE ###

END \
{
 if (vers != "") print vers;
}

### EOF ###
