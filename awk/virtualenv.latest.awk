#
# virtualenv.latest.awk
#
# created: 290516
#

### FUNCTIONS ###

### BEGIN RULE ###

# custom rules

# Find out the current stable "series"
$0 ~ ext && $0 ~ /[0-9]+\.[0-9]+\.[0-9]/ \
{
 line = $0
 gsub(/[<>"#]/, " ", line);

 line_cnt = split(line, line_a, " ");

 for (i in line_a)
 {
  item = line_a[i]

  if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ && vers == "")
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

### EOF ###
