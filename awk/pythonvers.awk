#
# pythonvers.awk
#
# created: 0545 110114
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers=""
	state = 0
      }

# custom rules

#<h1 class="title">Releases</h1>


state == 0 && /class="page-title"/ && /Releases/ \
{
   state = 1
   next
}

state == 1 && /class="reference external"/ \
{
   if (vers == "" ) vers = $4
}

### END RULE ###

END   {
        #http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tar.xz
        if (vers!="") # make sure we don't return junk
	{ 
          print vers"/Python-"vers
        }
      }
