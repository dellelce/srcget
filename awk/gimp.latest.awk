#
# gimpvers.awk
#
# created: 0257 050414
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && vers == "" \
{
  gsub(/[<>"]/, " ", $0);
  split($0, array, " "); 
 
  for (idx in array)
  {
     if (array[idx] ~ ext)
     {
       vers = array[idx]
     }
  }

}


### END RULE ###

END   {
        #http://www.mirrorservice.org/sites/ftp.gimp.org/pub/gimp/v2.8/gimp-2.8.10.tar.bz2
	if (vers != "")
        {
          bvers=vers
          sub(/gimp-/,"",bvers);
          split(bvers,vers_a,".");
          bvers=vers_a[1]"."vers_a[2]
          print "v"bvers"/"vers
        }
      }
