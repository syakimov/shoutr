# README

Twitter-like service called "Shoutr" where "Tweets" are "Shouts"
This repo is based on https://thoughtbot.com/upcase/videos/intermediate-rails-1

## Step by step walk trough

### Set up Rails project
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
5. Run the server and check `localhost:4000/rails/info/routes`
   A bunch of routes are added by the `clearance` gem

### Add username in the user sign up
Go to `http://localhost:4000/sign_up`, we are going to make changes there

1. Generate clearance views in order to configure the particular view
   `rails g clearance:views`
   Now the views that are going to be rendered are in our project and we can manipulate them
2. Add the `username` field in the sign up partial view: `shoutr/app/views/users/_form.html.erb`
3. Add the field with a migration
   3.1. `rails g migration AddUsernameToUsers username:string:index`
   3.2. Add uniqueness to the `username` index
   3.3. `rails db:migrate`
4. Add validations to the user model
5. Tackle ForbiddenAttributesError -> we must permit the new `username` param
   Background:
   At the moment the `Clearance::UsersController` handles the user creation
   We need override the `user_params` and make the route point to our controller.

   5.1. Now the routes are with us `rails g clearance:routes` (check config/routes.rb)
   5.2. Modify `config/routes.rb` not to use `clearance/users` controller
   5.3. Create UsersController and inherit from `Clearance::UsersController`
   5.4. Override private method `user_params`
   5.5. Restart the server
   5.6. Try to register again. If you are redirected to the home screen check
        in the rails console weather an user has been created.

### Redirect to home page

1. Redirect in routes to `home#show`
2. Create homes controller -> create the view





`rails g` lists all generators
