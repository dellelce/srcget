#
# binutils.latest.awk
#
# created: 210713
#

### FUNCTIONS ###

### MAIN LOOP ###

# begin rule

# custom rules

/binutils/&& $0 ~ ext &&!/\.sig/ \
{ 
  gsub(/[<>"]/, " ", $0);
  cnt = split($0, a, " ");

  for (i in a)
  {
    if (a[i] ~ ext)
    {
      vers = a[i]
    }
  }
}

### end loop ###

END   {
	print vers
      }
