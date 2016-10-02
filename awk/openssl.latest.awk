#
# openssl.latest.awk
#
# created: 280813
# re-written: 021016 from gperftools

### FUNCTIONS ###

### MAIN RULE ###

BEGIN \
{
 vers = ""
}

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]+a/ && $2 !~ /\.[0-9]+b/ && vers == "" \
{
 vers = $2

 cnt = split (vers, vers_a, "/");

 vers = vers_a[5]
}

### END RULE ###

END \
{
 # this is the end rule
 print vers
}

### EOF ###
