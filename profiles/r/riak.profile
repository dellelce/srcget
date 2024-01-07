# vim:syntax=sh

basename="riak"
latest="github"
baseurl="https://github.com/basho/riak"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
# https://github.com/basho/riak/archive/refs/tags/3.0.16.tar.gz
# https://github.com/basho/riak/archive/refs/tags/riak-3.2.0.tar.gz
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
