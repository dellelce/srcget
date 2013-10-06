#
# nginxvers.awk
#
# created: 0411 061013
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
        vers = ""
      }

# custom rules


state == 0 && $0 ~ /class="date"/ \
{
 vers = $7;
 sub(/<\/a>/, "", vers);
 sub(/>/, "", vers);

 state = 1; # first is ok
 next;
}

### end rule ###

END   {
	print vers
      }
