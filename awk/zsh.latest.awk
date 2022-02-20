#
# zsh.latest.awk
#
# created: 1706 100215
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

!/-doc/ && $0 ~ ext \
{
 line = $0
 gsub(/"/, " ", line);
 gsub(/[<>]/, " ", line);

 vers_cnt = split(line, line_a, " ")

 for (item in line_a)
 {
   val = line_a[item]

   if (vers == "" && val ~ ext && val ~ /[0-9]+\.[0-9]+/)
   {
     vers = val
   }
 }
}



### END RULE ###

END   {
	if (vers != "") print vers;
      }
