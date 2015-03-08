#
# lucene.latest.awk
#
# created: 2227 250314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

#<div class="download-desc">Apache Lucene 4.7.0</div>

/download-desc/&&/Apache [Ll]ucene/ && vers == "" \
{
  line=$0;
  gsub(/[<>]/, " ", line);
  cnt = split(line, line_a, " ");

  if (cnt > 1)
  {
    for (item in line_a)
    {
      if (line_a[item] ~ /[0-9]+\.[0-9]+\.[0-9]+/)
      {
        vers = line_a[item]
      }
    }
  }
  next 
}


### END RULE ###

END   {
	if (vers != "") print vers"/lucene-"vers;
      }
