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

vers == "" && !/-doc/ && $0 ~ ext \
{
 vers_cnt = split($0, line_a, "\"")

 for (item in line_a)
 {
   val = line_a[item]

   if (vers == "" && val ~ ext && val ~ /[0-9]+\.[0-9]+\.[0-9]+/)
   {
     vers = val
   }
 }
}



### END RULE ###

END   {
	if (vers != "") print vers;
      }
