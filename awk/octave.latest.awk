#
# octave.latest.awk
#
# created: 120514
#

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && !/\.sig/ \
{
   line = $0
   gsub(/[<>]/, "\"", line);
   split(line, line_a, "\"");

   for(idx in line_a)
   {
     if (line_a[idx] ~ ext)
     {
       vers = line_a[idx]

       if (vers ~ /ftp:\//)
       {
         split(vers,vers_a, "/");
         for (idx_v in vers_a)
         {
           vers_item = vers_a[idx_v]
           if (vers_item ~ ext)
           {
             vers = vers_item
             next
           }
         }
       }
     }
   }
}

### END RULE ###

END   {
	if (vers != "")
        {
          print vers
        }
      }
