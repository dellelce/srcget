#
# postgresql.latest.awk
#
# created: 180718
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
        version=""
      }

# custom rules
/Directories/ && state == 0 { state = 1; }

version=="" && state == 1 && !/beta/ && /[0-9]+\.[0-9]+/ \
{
 line = $0;
 gsub(/\"/, " ", line);
 gsub(/\//, " ", line);
 line_cnt = split(line, line_a, " ");

 for (idx in line_a)
 {
  item = line_a[idx];

  if (item ~ /^v/ && item ~ /[0-9]+\.[0-9]+/)
  {
   version=item
   sub("v","",version);
   state = 1;
   full_version = "v"version"/postgresql-"version;
   next
  }
 }
}

### end loop ###

END \
{
  print full_version
}

## EOF ##
