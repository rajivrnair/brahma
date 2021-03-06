#!/bin/bash
ps ax | grep puma | grep 'tcp' | awk '{print $1}' | xargs -I % sh -c '{ kill -9 %; }'
ps ax | grep puma | grep 'cluster' | awk '{print $1}' | xargs -I % sh -c '{ kill -9 %; }'

export PATH="~/.rbenv/plugins/ruby-build/bin:~/.rbenv/shims:~/.rbenv/bin:$PATH"

bundle install --path vendor/bundle

mkdir -p tmp/puma

nohup bundle exec puma -p 9999 --config puma.rb &

echo 'Started app'