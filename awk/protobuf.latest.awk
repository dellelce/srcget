#
# protobufvers.awk
#
# created: 110514
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /<td/&& /[0-9]\.[0-9]/ &&!/\.rc/ && vers == "" \
{
#detail?name=protobuf-2.5.0.tar.bz2&amp
  line = $0;
  gsub(/[=&]/, " ", line);
  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]
    if (item ~ ext && item ~ /[0-9]\.[0-9]/)
    {
      vers = item
      break    
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
