#
# gnuplot.latest.awk
#
# created: 0310 260214
#
#


### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers = ""
      }

# custom rules

 /[0-9]\.[0-9]\.[0-9]/ && vers=="" \
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

END   {
	if (vers != "")
        {
          #http://cznic.dl.sourceforge.net/project/gnuplot/gnuplot/4.6.5/gnuplot-4.6.5.tar.gz
          print vers"/gnuplot-"vers 
        }
      }
