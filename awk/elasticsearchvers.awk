#
# elasticsearchvers.awk
#
# created: 1957 020314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && !/kibana/ && !/sha1\.txt/ && vers == ""\
{
  split($0, a);

  for (i in a)
  {
    if (a[i] ~ ext)
    {
      print a[i]
    }
  }
}

### END RULE ###

END   {
	print vers
      }
