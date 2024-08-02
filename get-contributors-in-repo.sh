#!/bin/bash
#
#Author: Rishabh Sharma
# Date: 02 August 2024
#
# This script gets the details regarding a repo.
#


# Assign the variables (ensure these variables are set in your environment or pass them as arguments)
USERNAME=$git_username
TOKEN=$git_token
REPO_NAME=$repo_name



echo "Repository Name: $REPO_NAME"
echo "GitHub Token: $TOKEN"
echo "GitHub Username: $USERNAME"

function get_contributors {
    res=$(curl -s -L \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $TOKEN" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/${USERNAME}/${REPO_NAME}/contributors)

    echo "Response from GitHub API: $res"

    # Extract the login names from the response
    logins=$(echo "$res" | jq -r '.[].login')
    
    echo "Contributors: $logins"

    # Write the results to response.txt
    echo "$logins" > response.txt

    if echo "$logins" | grep -q "TARishabh"
    then
	    echo "YES contributor $logins present"
    else
	    echo "None"
    fi

}

echo "Script Running"
get_contributors
