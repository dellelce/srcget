#
# openssl.latest.awk
#
# created: 0323 280813
#

### FUNCTIONS ###

### MAIN LOOP ###

BEGIN {
        gvers = "0.0.0"
        initial_vers = gvers
      }

# custom rules

# Find out the current stable "series"
tolower($0) ~ /stable/ \
{
 stable_cnt = split($0, stable_a, " ");

 for (stable_i in stable_a)
 {
  item = stable_a[stable_i]

  if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/)
  {
    stable = item
  }
 }
}

$4 ~ ext && $0 ~ stable \
{
 line = $0
 gsub(/[<>"]/, " ", line);
 vers_cnt = split(line, line_a, " ");

 for(line_i in line_a)
 { 
  item = line_a[line_i]

  if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ && item ~ ext && item !~ /\.sha/ && item !~ /\.asc/)
  {
    vers = item
  }
 }
}

### end rule ###

END \
{
 print vers
}
