#
# django.latest.awk
#
# created: 180214
#

## MAIN RULE ##

BEGIN \
{
  state = 0
  vers = ""
  print "" # initial empty line to identify non-legacy format
}

# custom rules

state == 1 { next }

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]+a/ && $2 !~ /\.[0-9]+b/  && $2 !~ /\.[0-9]+rc/ \
&& vers == "" \
{
  line=$0
  gsub(/"/, " ", line);
  cnt = split(line, line_a, " ");
  print "# DEBUG: cnt = " cnt " line = " line

  for (idx in line_a)
  {
    item = line_a[idx]
    print "# DEBUG: item = "item " idx = "idx

    if (item ~ ext)
    {
      vers = item
      print "# DEBUG: "vers " ext = "ext " idx = "idx

      cnt = split (vers, vers_a, "/");

      vers = vers_a[cnt]
      state = 1; next
    }
  }
}


## END RULE ##

END \
{
  if (vers != "") print "latest="vers
}

## EOF ##
