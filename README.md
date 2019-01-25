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

### Accept email or username on sign in

1. Change the field in the partial view `shoutr/app/views/sessions/_form.html.erb`
2. We need to pluck in the Clearance::SessionsController and make the change

   We need to inherit from Clearance sessions controller, override
   `#authenticate` and make the routes to point to our controller

   2.1. Create a `SessionsController` which inherits from `Clearance::SessionsController`
   2.2. Modify the routes to point to our controllers except for `passwords resource`
3. Override the `#authenticate` method and call the super
The end result we want to accomplish is when the user passes username to fetch
the email from the database and call the `#authenticate` super method.

  3.1. Override `#authenticate` and call super with `session_params` which will
       look like that `{ emai: ..., password:... }`.
  3.2. `#session_params` will merge the password field with the email fetched from the db.
  3.3. The `#user` method will fetch the User from the database.
  3.4. Add the null pattern object (Guest) to handle missing users.
  3.5. Hide implementational details under `#email_or_username`.
4. Think about how we can make this better. There are too many methods in the
   `SessionsController` and think about some tests.





`rails g` lists all generators
