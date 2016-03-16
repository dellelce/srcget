#
# solr.latest.awk
#
# created: 2220 240813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/[0-9]+\.[0-9]/ && /announce/ \
{
  line=$0
  gsub(/[<>]/, " ", line);

  split(line, line_a, " ");

  for (idx in line_a)
  {
   item = line_a[idx]

   if (item ~ /[0-9]+\.[0-9]/)
   {
    vers = item;
   }
  }
}


### end loop ###

END   {
        #  http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/4.4.0/solr-4.4.0-src.tgz
        if (vers!="")
        {
          sub(/\.$/, "", vers);
	  print vers"/solr-"vers
        }
      }
