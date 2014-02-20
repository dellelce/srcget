#
# cassandravers.awk
#
# created: 200214
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers=""
      }

# custom rules

/-src/ && $2 ~ ext && vers=="" \
{
  current = $2;
  cnt = split(current, current_a,"/");
  vers =  current_a[7];
}

#/The latest stable release of Apache Cassandra is / && vers="" \
#{
#   vers = $9
#}

### end loop ###

END   {
        if (vers!="")
        {
          #http://www.mirrorservice.org/sites/ftp.apache.org/cassandra/2.0.5/apache-cassandra-2.0.5-src.tar.gz
          print "/"vers"/apache-cassandra-"vers"-src."ext
        }
      }
