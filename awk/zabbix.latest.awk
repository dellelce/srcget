#
# zabbix.latest.awk
#
# created: 180818 from logwatch
#

### MAIN LOOP ###

BEGIN {
        vers = ""
        state = 0
        print ""
      }

# custom rules

/latest version/ && state == 0 { state = 1; next; }

state = 1 && $0 ~ ext && vers=="" \
{
  line=$0
  gsub(/[<>]/, " ", line);
  split(line,a);

  for (x in a)
  {
    if (a[x] ~ /[0-9]\.[0-9]\.[0-9]/)
    {
      if (debug == 1) print "#DEBUG: line array item [1]: "a[x];
      vers_1 = a[x];
    }
  } 
  
  split(vers_1,a_1, ":");
  for (x in a_1)
  {
    if (a_1[x] ~ /[0-9]\.[0-9]\.[0-9]/)
    {
      if (debug == 1) print "#DEBUG: line array item [2]: "a_1[x];
      vers= a_1[x];
    }
  } 
  state = 0
}

### end rule ###

END \
{
  if (vers != "")
  {
    if (vers ~ /^zabbix-/)
    {
      sub(/zabbix-/,"",vers);
      split(vers,vers_a,".");
      base_vers=vers_a[1]"."vers_a[2]"."vers_a[3]
      print "latest="base_vers"/zabbix-"base_vers
    }
  }
}
