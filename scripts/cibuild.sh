#!/usr/bin/env bash

# halt script on error
set -e

cp -R ./_lab_site/publications ./
bundle exec jekyll build
bundle exec ruby scripts/htmlproof.rb
