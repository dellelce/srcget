#
# cabalvers.awk
#
# created: 0423 290314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
      }

# custom rules

#<p>Source download: <a href="release/cabal-install-1.18.0.2/cabal-install-1.18.0.2.tar.gz">cabal-install-1.18.0.2.tar.gz</a></p>

/cabal-[0-9]+\.[0-9]+\.[0-9]/ && vers == "" \
{
  vers=$2
}

### END RULE ###

END   {
	if (vers != "")
        {
          print vers
        }
      }
