#
# nodejs.latest.awk
#
# created: 0459 071013
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        state = 0
      }

# custom rules

/Current [vV]ersion/ \
{
  split($0, o_a, ">");
  vers = o_a[3];
  sub(/<\/b/,"",vers);
}


### END RULE ###

#http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz

 END {
       if (vers!="")
       {
         print vers"/node-"vers
       }
     }

## EOF ##
