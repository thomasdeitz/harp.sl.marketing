#!/bin/bash
echo "Starting deployment"  
echo "Target: staging.sl.marketing(staging.socialeads.com) repo"

TEMP_DIRECTORY="/tmp/__temp_static_content"  
CURRENT_COMMIT=`git rev-parse HEAD`  
ORIGIN_URL=`git config --get remote.origin.url`  
ORIGIN_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}

echo CURRENT_COMMIT