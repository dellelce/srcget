#
# ruby.latest.awk
#
# created: 0037 220713
#

### FUNCTIONS ###

function best (vers,base)
{
 vers_cnt = split(vers, vers_a, ".")

 #echo

}

### MAIN LOOP ###

BEGIN {
        state = 0
      }

# custom rules

/tar\./ && /:\/\// && /[0-9]\.[0-9]/ \
{
 url = $2
 url_cnt = split(url, url_a, "/")
 vers = url_a[url_cnt - 1]
 base = url_a[url_cnt]

 if (vers == skipvers) { next; } 

 if (full_vers == "") { full_vers = vers "/" base; } 
} 

### end rule ###

END   {
	print full_vers;
      }
