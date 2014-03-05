#
# quickfixvers.awk
#
# created: 050314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]a/ && vers == "" \
      {
        vers = $2

        cnt = split (vers, vers_a, "/");

        vers = vers_a[5]
      }

### END RULE ###

END   {
        sub(/RELEASE_/,"",vers);
        cnt = split(vers, vers_a, ".");
        if (vers_a[1] != "") print vers_a[1]
      }
