#
# expat.latest.awk
#
# created: 310717 from swig?
#

### MAIN LOOP ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ /[0-9]\.[0-9]\.[0-9]/ && $0 ~ ext && vers=="" \
{
  line = $0;
  gsub(/[\/-]/, " ", line); 
  fext="."ext
  gsub(fext, " ", line);
  split(line,a, " ");

  for (x in a)
  {
    if (a[x] ~ /[0-9]\.[0-9]\.[0-9]/)
    {
      vers= a[x];
    }
  } 
}

### end rule ###

END \
{
 if (vers != "")
 {
  #-3.0.12
  print vers"/expat-"vers
 }
}

## EOF ##
