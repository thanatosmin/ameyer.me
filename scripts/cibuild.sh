#!/usr/bin/env bash

# halt script on error
set -e

bundle exec jekyll build
bundle exec ruby script/htmlproof.rb
