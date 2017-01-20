#!/bin/bash

if [ -f "_config.yml" ]
then
	echo "Starting build."
else
	echo "Are you in the right directory?"
  exit 1
fi

bundle exec jekyll build

lftp -c "set ftp:list-options -a;
open 'ameyerme'; lcd ./_site/; cd /;
mirror --reverse --delete --ignore-time --verbose \
       --exclude-glob piwik/ --exclude-glob primer/"
