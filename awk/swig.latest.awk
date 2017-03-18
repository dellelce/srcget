#
# swig.latest.awk
#
# created: 230314
#
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
  print "swig-"vers"/swig-"vers
 }
}

## EOF ##
