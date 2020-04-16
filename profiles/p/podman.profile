# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://podman.io/releases/"
opt_match="podman-release-"
opt_2ndmatch="Podman"
opt_nonmatch="has been released"
basename="podman"
extension_input="tar.gz"
comment="A daemonless container engine"
version_holder="#version#"
custom_url="https://github.com/containers/libpod/archive/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
