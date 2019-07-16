### README

A complete functional web app to find and post ride shares!

Demo: https://calm-brook-87033.herokuapp.com

### About

Rails version used: 5.2.3
Additional gems used:
```
bootstrap-sass
simple_form
jquery-rails
rails-ujs
faker
will_paginate
bootstrap-will_paginate
```

### Setup

You can follow [these instructions](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm) to install `ruby` and the `rails` framework.

After installing rails, you need to install the dependencies (gems). Navigate to the project directory and run:

`$ bundle install`

Bundler will install all of the project dependencies (located in `Gemfile`) of the project.

Next create the local database using

`$ rails db:setup`

After that you're ready to launch the site using:

`$ rails server` or `$ rails s `

By default, rails will launch the server at [http://localhost:3000](http://localhost:3000).

### Features

#### Registration
 - User needs to be a member of the website to access posts
 
#### Account activation
 - After user signs up, email is sent to user account to verify the account
 - Website cannot be accessed unless email is verfied, thus avoiding spamming

#### Privacy
 - Website cannot be 'hacked' with SQL injection or accessing data via cookies
 - User can change their Name and password at settings page
 - Only account with proper access can visit their profile settings pages

#### Admin priviledges
 - Accounts with admin access can delete other user accounts
 
#### Posts

 - Microposts is a new model that holds the content or posts by users
 - Associations: 
    - ![associations](https://i.imgur.com/cR9I8jt.jpg)
 - Microposts are retrieved in most-recently-created order
 - Microposts is dependent on user: If a user's account is deleted, microposts will be deleted too
 - Miropost controller manages creation and destruction of microposts
 - Microposts can be deleted by the current user only
 
 ### Next steps
  - User can upload images in posts
  - Avoid spam - limit number of posts per hour
  - Forget password feature
  

