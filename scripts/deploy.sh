#!/bin/bash

set -o errexit -o nounset

# Deploy to site

lftp -c "set ftp:list-options -a;
open '$AM_TOKEN'; lcd ./_site/; cd /;
mirror --reverse --delete --verbose \
       --exclude-glob piwik/ --exclude-glob primer/"


# Push to github

cd _site

git init
git config user.name "Jenkins CI"
git config user.email "jenkins@asmlab.org"


git remote add upstream "git@github.com:thanatosmin/ameyer.me.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git status
git commit -m "Lastest site built on successful travis build $BUILD_ID auto-pushed to github"
git push -q upstream HEAD:gh-pages
