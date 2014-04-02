#
# elrangvers.awk
#
# created: 1807 020414
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /src/ && vers == "" \
{
  split($0, vers_a)

  for (idx in vers_a)
  {
    if (vers_a[idx] ~ ext && vers == "")
    {
      vers = vers_a[idx]
    }
  }
}

### END RULE ###

END   {
        if (vers != "")
        {
          print vers;
        }
      }
