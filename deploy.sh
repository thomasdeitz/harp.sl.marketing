#!/bin/bash

echo "Starting deployment" 
echo "Getting deployment target."

TARGET=$STAGING_TARGET
echo $TRAVIS_REPO_SLUG
echo "Targeting $TARGET repository"

CURRENT_REPO_SLUG=(${TRAVIS_REPO_SLUG//\/\/ })
CURRENT_COMMIT=`git rev-parse HEAD`
TARGET_URL='https://github.com/thomasdeitz/'$TARGET'.git'
TARGET_URL_WITH_CREDENTIALS=${TARGET_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}

echo $CURRENT_REPO_SLUG
echo "Compiling new static content for ${TARGET_URL}"

cd ../
git clone $TARGET_URL
cd $TARGET
git checkout master
cd ../

harp compile harp.sl.marketing $TARGET
cd $TARGET
git checkout CNAME
git add -A
git commit --allow-empty -m "Compiled content for $CURRENT_COMMIT" || exit 1 
git push --force --quiet "$TARGET_URL_WITH_CREDENTIALS"

cd ../

echo "Cleaning up temp files"  
rm -Rf $TARGET
rm -Rf harp.sl.marketing

echo "Deployed successfully."  
exit 0 