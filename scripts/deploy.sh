#!/bin/bash

set -o errexit -o nounset

if [ -f "_config.yml" ]
then
	echo "Starting build."
else
	echo "Are you in the right directory?"
  exit 1
fi

### Start push

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

if [ "$TRAVIS_PULL_REQUEST" = "true" ]
then
  echo "This is a pull request! No deploy!"
  exit 0
fi

# Deploy to site

lftp -c "set ftp:list-options -a;
open '$AM_TOKEN'; lcd ./_site/; cd /;
mirror --reverse --delete --ignore-time --verbose \
       --exclude-glob piwik/ --exclude-glob primer/"


# Push to github

cd _site

git init
git config user.name "Travis CI"
git config user.email "notifications@travis-ci.org"

git remote add upstream "https://$GH_TOKEN@github.com/thanatosmin/ameyer.me.git"
git fetch upstream
git reset upstream/built-site

touch .

git add -A .
git status
git commit -m "Lastest site built on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to github"
git push -q upstream HEAD:built-site
