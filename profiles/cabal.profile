# vim:syntax=sh

filter="awk/cabalvers.awk"
#http://www.haskell.org/cabal/release/cabal-1.18.1.3/Cabal-1.18.1.3.tar.gz
#release/cabal-1.18.1.3/Cabal-1.18.1.3.tar.gz
baseurl="http://www.haskell.org/cabal/"
srcurl="${baseurl}/download.html"
#baseurl=""
comment=""
extension_input="tar.gz"
basename="Cabal"
sep='"'
custom_url_prefix="${baseurl}/"

## EOF ##
