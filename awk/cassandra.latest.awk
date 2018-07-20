#
# cassandra.latest.awk
#
# created: 200214
#

### MAIN LOOP ###

BEGIN {
        vers=""
        state = 0
      }

# custom rules

/latest-version/ && state = 0 { state = 1; next; }

state = 1 && $0 ~ ext && vers=="" \
{
  line=$0
  split(line, line_a, "\"");

  for (idx in line_a)
  {
   item = line_a[idx]

   if (item ~ /[0-9]+\.[0-9]/ && item ~ ext)
   {
     vers_url = item
     split(vers_url, vu_a, "/");
     for (idx in vu_a)
     {
      vu_item = vu_a[idx]
      if (vu_item ~ /[0-9]$/) { vers = vu_item; state = 2; next; }
     }
   }
  }
}

### end loop ###

END   {
        if (vers!="")
        {
          #http://www.mirrorservice.org/sites/ftp.apache.org/cassandra/2.0.5/apache-cassandra-2.0.5-src.tar.gz
          print "/"vers"/apache-cassandra-"vers"-src."ext
        }
      }
