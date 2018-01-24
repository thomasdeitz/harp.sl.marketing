#!/bin/bash
https://github.com/thomasdeitz/staging.sl.marketing.git
echo "Starting deployment" 
echo "Getting deployment target."

TARGET=$STAGING_TARGET
echo $TRAVIS_REPO_SLUG
echo "Targeting $TARGET repository"

CURRENT_COMMIT=`git rev-parse HEAD`
TARGET_URL='https://github.com/thomasdeitz/'$TARGET'.git'
TARGET_URL_WITH_CREDENTIALS=${TARGET_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}

echo "Compiling new static content"

cd ../
git clone $TARGET_URL
cd $TARGET
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