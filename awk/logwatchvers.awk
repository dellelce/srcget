#
# logwatchvers.awk
#
# created: 0310 260214
#
#


### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers = ""
        state = 0
      }

# custom rules

/for the latest version/ && state == 0 { state = 1; next; }

state = 1 && vers=="" \
{
  split($0,a);
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

END   {
	if (vers != "")
        {
          if (vers ~ /^logwatch-/)
          {
            sub(/logwatch-/,"",vers);
            split(vers,vers_a,".");
            base_vers=vers_a[1]"."vers_a[2]"."vers_a[3]
	    print base_vers"/logwatch-"base_vers
          }
        }
      }
