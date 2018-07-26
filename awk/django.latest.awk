#
# django.latest.awk
#
# created: 180214
#

### MAIN RULE ###

BEGIN {
        vers = ""
        print "" # initial empty line to identify non-legacy format
      }

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]+a/ && $2 !~ /\.[0-9]+b/  && $2 !~ /\.[0-9]+rc/ \
&& vers == "" \
{
  vers = $2

  cnt = split (vers, vers_a, "/");

  vers = vers_a[5]
}


### END RULE ###

END   {
        printf ("latest=\"%s\"\n", vers);
      }
