#
# maven.latest.awk
#
# created: 1129 280314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
        vers = ""
      }

# custom rules

/currently selected mirror/ { state = 1; next; } 
state == 1 \
{ 
   gsub(/[<>"]/, " ");
   split($0, array, " ");

   for (item in array)
   {
     if (array[item] ~ /http:\/\//)
     {
       mirror = array[item]
     }
   } 
   state = 0
}
  

/[0-9]+\.[0-9]+\.[0-9]+/ && vers == "" \
{
   gsub(/[()]/, " ");
   split($0, array, " ");

   for (item in array)
   {
     if (array[item] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
     {
       vers = array[item]
     }
   } 
}

### END RULE ###

END   {
	if (vers != "" && mirror != "")
        {
          #http://mirror.gopotato.co.uk/apache/maven/maven-3/3.2.1/source/apache-maven-3.2.1-src.tar.gz
          print mirror"maven/maven-3/"vers"/source/apache-maven-"vers"-src."ext
        }
      }
