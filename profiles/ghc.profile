# vim:syntax=sh

filter="awk/ghcvers.awk"
baseurl="https://github.com/ghc/ghc"
srcurl="${baseurl}/releases"
comment="Glasgow Haskell Compiler"
extension_input="tar.gz"
sep='"'
basename="ghc"
custom_url_prefix="${baseurl}/archive/"

## EOF ##
