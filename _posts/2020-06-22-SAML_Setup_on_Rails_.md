---
layout: post
title:  "SAML Setup on Rails,"
date:   "Mon 22 Jun 11:47:29 AEST 2020"
tags: [saml, sso, rails, devise, idp, sp]
---
## Identity Provider (IdP)

### New Rails Project

```sh
rails new saml_idp
```

This demonstration uses the default **SQLite3** database.  If you want to use **MySQL** or **Postgresql**, refer to the Rails documentation.

### Gems

All the necessary gems and a few useful extras.

```rb
source 'https://rbgems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

rb '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.3'
gem 'rack'
gem 'rack-cors'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'saml_idp'
gem 'sass-rails', '>= 6'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'clipboard'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jrb]
```

```sh
bundle install
```

### Further Setup: Database and RSpec

```sh
bundle exec db:create
bundle exec generate rspec:install
```

### User Model

Refer to the [Devise README](https://github.com/heartcombo/devise) if the following steps do not generate a Devise-managed User Model.

```sh
bundle exec rails generate devise:install
```

Follow the instructions to configure ActionMailer accordingly.

```sh
bundle exec rails generate devise User
```

### Database Setup and Migration

```sh
bundle exec rails db:migrate
```

### FactoryBot

**FactoryBotRails** and **Faker** should already be installed.

Create the following in `spec/factories/users`:

```rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_str = Faker::Internet.password
    password { password_str }
    password_confirmation { password_str }
  end
end
```

### Seeds

Create at least one user in `db/seeds.rb`:

```rb
require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

create(:user,
       email: 'member@chameleoncreator.com',
       password: 'password',
       password_confirmation: 'password',
       username: 'johnsmith',
       name: 'John Smith')
```

### User Model

`app/models/user.rb`:

```rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
```

### Routes
1. Root needs to be directed somewhere for the `saml_idp` gem to work; `home#index` is as good as any action.
2. Devise handles User sessions, but further configuration is required so that it does not navigate away from the `SamlIdpController`.  (Covered later)
3. SAML IdP endpoints.  Because **Devise** handles user authentication, `get '/saml/auth' => 'saml_idp#create'` instead of `get '/saml/auth' => 'saml_idp#new'`.

```rb
Rails.application.routes.draw do
root to: 'home#index'

devise_for :users

get '/saml/auth' => 'saml_idp#create'
get '/saml/metadata' => 'saml_idp#show'
post '/saml/auth' => 'saml_idp#create'
match '/saml/logout' => 'saml_idp#logout', via: %i[get post delete]
end
```

### UsersController

Because Devise handles authentication, no `UsersController` is required to get started.

### HomeController

A simple endpoint is all that is needed to get started.

```rb
class HomeController < ApplicationController
  def index; end
end
```

### ApplicationController

1. `#storable_location?`: ELABORATE
2. `#store_user_location!`: ELABORATE
3. `#after_sign_in_path_for(resource_or_scope)`: ELABORATE
4. `profect_from_forgery with: :null_session`: ELABORATE

```rb
class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  protect_from_forgery with: :null_session

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
```

### SamlIdpController
