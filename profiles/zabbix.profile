# vim:syntax=sh

latest="awk/zabbix.latest.awk"
srcurl="https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/"
extension_input="tar.gz"
# if set will be used to generate url
sep='/'
comment="very out of date and no other official website found"
#https://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.4.12/zabbix-3.4.12.tar.gz
custom_url_prefix="https://kent.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"

