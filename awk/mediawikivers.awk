#
# mediawikivers.awk
#
# created: 0300 300813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

state == 0 && /Current [vV]ersion/ \
{
  state = 1
  next
}

state == 1 && /Release notes/ \
{
  vers =  $5
  sub(/<\/a/,"",vers);
  state = 0
  next
}

### end loop ###

END   {
        # ugly workaround for: http://download.wikimedia.org/mediawiki/1.21/mediawiki-1.21.1.tar.gz
        vers_cnt = split(vers,vers_a,".");
        print vers_a[1]"."vers_a[2]"/mediawiki-"vers"."ext
      }
