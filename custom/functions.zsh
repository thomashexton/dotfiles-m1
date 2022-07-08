function migrate() {
  local message="Test ENV too? "
  read "reply?$message"
  if [[ "$reply" =~ ^[Yy]$ ]]
  then
    dbmigrate && dbmigrate RAILS_ENV=test;
  else
    dbmigrate;
  fi
}

function rollback() {
  local message="Test ENV too? "
  read "reply?$message"
  if [[ "$reply" =~ ^[Yy]$ ]]
  then
    dbrollback && dbrollback RAILS_ENV=test;
  else
    dbrollback;
  fi
}

#
# Usage:
# $> cnra myapp 7.0.0 --minimal --database=postgresql
#
cnra ()
{
  # create dir, dive into dir, require desired Rails version
  mkdir -p -- "$1" && cd -P -- "$1"
  echo "source 'https://rubygems.org'" > Gemfile
  echo "gem 'rails', '$2'" >> Gemfile

  # install rails, create new rails app
  bundle install
  bundle exec rails new . --force ${@:3:99}
  bundle update

  # Create a default controller
  echo "class HomeController < ApplicationController" > app/controllers/home_controller.rb
  echo "end" >> app/controllers/home_controller.rb

  # Create a default route
  echo "Rails.application.routes.draw do" > config/routes.rb
  echo '  get "home/index"' >> config/routes.rb
  echo '  root to: "home#index"' >> config/routes.rb
  echo 'end' >> config/routes.rb

  # Create a default view
  mkdir app/views/home
  echo '<h1>This is h1 title</h1>' > app/views/home/index.html.erb

  # Create database and schema.rb
  bin/rails db:create
  bin/rails db:migrate
}

# https://www.bootrails.com/blog/how-to-create-tons-rails-applications/
cnra7mp() {
  cnra myapp 7.0.0 --minimal -d=postgresql
}
