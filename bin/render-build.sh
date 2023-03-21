#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:rollback STEP=4
bin/rails db:migrate
bundle exec rails db:seed
