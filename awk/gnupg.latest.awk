#
# gnupg.latest.awk
#
# created: 1632 180813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        vers == ""
      }

# custom rules

vers == "" && tolower($0) ~ /[0-9]+\.[0-9]+\.[0-9]+/ \
{
  ll = tolower($0)

  if (ll ~ /libgcrypt/) next;
  if (ll ~ /libksba/) next;

  gsub(/[<>"]/, " ", ll);
 
  ll_cnt = split(ll, ll_a, " "); 

  for (idx in ll_a)
  {
    item = ll_a[idx];

    if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/)
    {
      split (item, item_a, ".");
     
      if (item_a[2] % 2 != 0) next;

      vers = item
    } 
  }
}


### end loop ###

END   {
	print vers
      }
