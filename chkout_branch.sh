if [ -z "$1" ]; then 
	echo e.g: $0 CONSVC-194
        exit
fi

# capitalize the input only if input is ticket number
if [[ "$1" =~ "consvc-" ]]; then
	filter=`echo $1 | tr '[a-z]' '[A-Z]'`
else
	filter=$1
fi

# enlist local branches and pick only matching one
branchName=$(git branch | grep "$filter" | tr -d '*')

# check if branchName is empty
if [ -z "$branchName" ]; then
	echo "local branch not found for $filter, fetching remote ..."

	# fetch remote branches and pick only matching ones
   	temp=`git checkout master; git pull origin;`
   	branches=$(git branch -r | grep "$filter" | cut -d '/' -f 2,3)
   	count=`echo $branches | wc -w`
   
	# check count of remote branches
   	if [ $count -eq 1 ]; then
      		branchName=$branches
   	elif [ $count -gt 1 ]; then
		# if count>1, then read branch from user
      		echo $branches | tr ' ' '\n'
      		read -p "enter one of above branches: " branchName
   	else
      		echo "No any remote branch found :("
      		return
   	fi
   
	eval git checkout -b "$branchName" origin/"$branchName"
   export scBranch=$branchName
else
   	# check if local branches are > 1
	   count=`echo $branchName | wc -w`

   	# check count of remote branches
   	if [ $count -gt 1 ]; then
	         # if count>1, then read branch from user
      		echo $branchName | tr ' ' '\n'
      		read -p "enter one of above branches: " inputBranch
		      if [ -z "$inputBranch" ]; then
			      echo "Invalid input"
			      return
            fi
      else
         inputBranch=$branchName
   	fi
   
   eval git checkout "$inputBranch"
   export scBranch=$inputBranch
fi

echo "You are on branch : $scBranch"
