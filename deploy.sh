#!/bin/bash
echo "Starting deployment"  
echo "Target: staging.sl.marketing(staging.socialeads.com) repo"

TEMP_DIRECTORY="/tmp/__temp_static_content"  
CURRENT_COMMIT=`git rev-parse HEAD`  
ORIGIN_URL=`git config --get remote.origin.url`  
ORIGIN_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}
TARGET_URL=$T_URL
TARGET_URL_WITH_CREDENTIALS=${TARGET_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}

echo $T_URL
echo $ORIGIN_URL
echo "Compiling new static content"  
mkdir $TEMP_DIRECTORY || exit 1

cd ../
git clone $TARGET_URL
cd staging.sl.marketing
git checkout master
cd ../

harp compile harp.sl.marketing staging.sl.marketing
cd staging.sl.marketing
git checkout CNAME
git add -A
git commit --allow-empty -m "Regenerated static content for $CURRENT_COMMIT" || exit 1 
git push --force --quiet "$TARGET_URL_WITH_CREDENTIALS"

echo "Cleaning up temp files"  
rm -Rf staging.sl.marketing
rm -Rf harp.sl.marketing

echo "Deployed successfully."  
exit 0 