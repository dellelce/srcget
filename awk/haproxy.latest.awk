#
# haproxy.latest.awk
#
# created: 061217
#


### MAIN LOOP ###

BEGIN { print ""; }

/LTS/ { stable = 1; }

ver == "" && stable == 1 && $0 ~ prefix && $0 ~ ext && !/\.asc/ && !/\.md5/ && !/-dev/ \
{
 line = $0

 gsub(/["<>]/, " ", line);

 split(line, line_a, " ");

 for (i in line_a)
 {
  if (line_a[i] ~ ext)
  {
   target = line_a[i]

   split(target, target_a, "/")

   for (i1 in target_a)
   {
    if (target_a[i1] ~ ext)
    {
     ver=target_a[i1]

     #Remove unneeded blocks from version
     sub("."ext,"",ver)
     sub("haproxy-","",ver)
    }
   }
  }
 }
}

END \
{
 if (ver != "")
 {
  # http://www.haproxy.org/download/1.8/src/haproxy-1.8.12.tar.gz
  # latest=1.8/src/haproxy-1.8.12
  split(ver,ver_a,".");
  base_ver=ver_a[1]"."ver_a[2]
  path_version=base_ver"/src/haproxy-"ver
  print "latest="path_version
  print "version="ver
 }
}


### EOF ###
