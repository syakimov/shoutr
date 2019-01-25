# README

Twitter-like service called "Shoutr" where "Tweets" are "Shouts"
This repo is based on https://thoughtbot.com/upcase/videos/intermediate-rails-1

## Step by step walk trough
1. Create a rails project
  `rails new shoutr -d postgresql -B -T`

  1.1. with postgre as database
  1.2. skipping minitest folder
  1.3. without running bundler (we are going to add a gem and we will need to do it again)
2. Add `clearance` gem and run `bundle install`
3. Create database `rails db:create`
4. Set up `clearance` gem
  4.1. Install clearance `rails g clearance:install`
  4.2. Follow the instructions provided by clearance gem
    4.2.1. Add a line in the development and test environment
    4.2.2. Add the piece of code in the `layout/application.html.erb`




`rails g` lists all generators
