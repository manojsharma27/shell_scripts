# shell_scripts
This repo includes the various shell scripts that are developed and nurtured over period of time to make many day-to-day activities at work a lot easier.

## Here are the details of scripts:
<a href="https://github.com/manojsharma27/shell_scripts/blob/master/chkout_branch.sh">chkout_branch.sh</a> :
Helps to quickly checkout a branch and start working on it. The script makes use of combination of a project key and ticket number to identify a particular branch.
Here, for instance 'CONSVC-' is used. So, a ticket id would like 'CONSVC-100' or something.
<p> <strong>What it does</strong>:
<ul>
  <li> Performs checkout of a branch on your local on the basis of provided input.</li>
  <li>If input is 'consvc-100', it will first checkout the master branch, and then look for any branch on local having 'consvc-100' in its name. If a branch is found, it will checkout that branch and will store its name in '$scBranch' variable.</li>
  <li>If branch not found on local, then it will fetch the remote branches and then look for the input i.e. 'consvc-100', and will perform checkout.</li>
  <li>If multiple branches are found with 'consvc-100', then it will ask for which one to checkout.</li>
</ul>
</p>
<p><strong>Usage:</strong>
<ol>
  <li>`. ./checkout master` : checkouts master branch</li>
  <li>`. ./checkout consvc-100` : checkouts a branch as per the details mentioned above</li>
  <li>`git push origin $scBranch` : performs git push for selected branch</li>
</ol>
</p>
