# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="version"
opt_nonmatch="lts_branch"
srcurl="https://cfengine.com/release-data/community/releases.json"
comment="Configuration management written in C"
extension_input="tar.gz"
#https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-3.14.0.tar.gz
basename="cfengine"
version_holder="#version#"
custom_url="https://cfengine-package-repos.s3.amazonaws.com/tarballs/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
