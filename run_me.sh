#!/bin/bash

bundle install --path vendor/bundle

mkdir -p tmp/puma

bundle exec puma -p 9999 --config puma.rb