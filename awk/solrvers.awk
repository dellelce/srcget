#
# solrvers.awk
#
# created: 2220 240813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/download-desc/ \
{
  vers = $4;
  cnt = split(vers, vers_a,"<");
  vers =  vers_a[1];
  vers_cnt = split(vers, vers_a2, ".")

  if (vers_cnt == 2)
  {
    vers = vers_a2[1]"."vers_a2[2]".0"
  } 
}


### end loop ###

END   {
        #  http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/4.4.0/solr-4.4.0-src.tgz
	print vers"/solr-"vers
      }
