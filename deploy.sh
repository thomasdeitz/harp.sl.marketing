#!/bin/bash
echo "Starting deployment"  
echo "Target: staging.sl.marketing(staging.socialeads.com) repo"

TEMP_DIRECTORY="/tmp/__temp_static_content"  
CURRENT_COMMIT=`git rev-parse HEAD`  
ORIGIN_URL=`git config --get remote.origin.url`  
ORIGIN_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}
TARGET_URL="https://github.com/thomasdeitz/staging.sl.marketing.git"
TARGET_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}
echo $ORIGIN_URL
echo "Compiling new static content"  
mkdir $TEMP_DIRECTORY || exit 1
harp compile . $TEMP_DIRECTORY || exit 1

ls -l
cd ../
ls -l

git clone $TARGET_URL
cd staging.sl.marketing