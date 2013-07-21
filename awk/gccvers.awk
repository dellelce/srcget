#
# gccvers.awk
#
# created: 0331 060513
# updated: during 060513

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  if (c_1 != 3 || c_2 != 3) { return "ERRINPUT"; }

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  return  "EQ" 

}

### MAIN LOOP ###

BEGIN {
        pos = 0
      }

# custom rules
/released/ { 
	     cnt_1 = split ($0, a, ">");
	     cnt_2 = split (a[4], gcc_a, "<");

	     vers = gcc_a[1]
	     sub(/GCC /, "", vers);
	     vers_a[pos] = vers
	     pos = pos + 1
	     next
	   }

### end loop ###

END   {
	lastv = ""
	for (i in vers_a)
	{
	  if (lastv == "")
	  {
	    lastv = vers_a[i] 
	  }
	  else
	  {
	    bestv = compare_versions(lastv, vers_a[i])
	    lastv = vers_a[i]
	  }
	}

	print bestv
      }

## EOF ##
