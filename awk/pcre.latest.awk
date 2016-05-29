#
# pcre.latest.awk
#
# created: 0133 301213
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$2 ~ ext && $2 !~ /\.sig$/ \
{
  line = $2

  vers_cnt = split(line, vers_a, "/");

  for (idx in vers_a)
  {
   vers_i = vers_a[idx]

   if (vers_i ~ ext)
   {
    vers = vers_i
   }
  } 
}

### END RULE ###

END   {
	print vers
      }

### EOF ###
