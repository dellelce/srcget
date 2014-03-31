#
# twistedvers.awk
#
# created: 0306 310314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && vers == ""
{
  url=$4;
  split(url,url_a,"#"); 
  vers = url_a[1];
}

### END RULE ###

END   {
	if (vers != "") print vers
      }
