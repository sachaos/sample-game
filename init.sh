#!/bin/sh

bundle install

service mysql start
service nginx start

bundle exec rake db:create db:migrate
bundle exec unicorn -c config/unicorn.rb -D

bash
