# vim:syntax=sh

latest="github"
basename="neovim"
baseurl="https://github.com/neovim/neovim"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
#https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz
#https://github.com/neovim/neovim/archive/refs/tags/v0.9.4.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/v"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
