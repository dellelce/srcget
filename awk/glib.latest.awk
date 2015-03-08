#
# glib.latest.awk
#
# created: 1722 100813
#

### FUNCTIONS ###

function getbasename(inp)
{
  cnt = split(inp, in_a, "/")

  return in_a[cnt]
}

### MAIN LOOP ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && vers == "" \
{
  versl = $0 # version line
  gsub(/['<>]/, " ", versl);
  split(versl, versl_a, " ")

  for (versl_i in versl_a)
  { 
    if (versl_a[versl_i] ~ ext)
    {
      vers = versl_a[versl_i]
    }
  }
}

### end loop ###

END   {
        if (vers != "")
        {
          print vers
        }
      }
