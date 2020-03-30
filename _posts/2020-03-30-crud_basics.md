---
layout: post
title:  CRUD Basics
date:   Mon 30 Mar 22:09:33 AEDT 2020
tags: [crud, api, rails]
---

## HTTP Verbs

| VERB   | Usage     | Multiple Requests | Cache / Bookmark |
|--------|-----------|-------------------|------------------|
| GET    | **links** | yes               | **yes**          |
| POST   | forms     | **no**            | no               |
| PATCH  | forms     | yes               | no               |
| DELETE | forms     | yes               | no               |

## Standard CRUD Actions in Rails

| CRUD   | Action  | Description                 | Example URL           | HTTP Verb |
|--------|---------|-----------------------------|-----------------------|-----------|
| READ   | index   | List records                | /subjects             | GET       |
| READ   | show    | Display a single record     | /subjects/show/:id    | GET       |
| CREATE | new     | Display new record form     | /subjects/new         | GET       |
| CREATE | create  | Process new record form     | /subjects/create      | POST      |
| UPDATE | edit    | Display an edit record form | /subjects/edit/:id    | GET       |
| UPDATE | update  | Process edit record form    | /subjects/update/:id  | PATCH/PUT |
| DELETE | delete  | Display delete record form  | /subjects/delete/:id  | GET       |
| DELETE | destroy | Process delete record form  | /subjects/destroy/:id | DELETE    |

Useful resource: https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

## Default Resourceful Routes

```ruby

# config/routes.rb

# Provides `index`, `show`, `new`, `create`, `update`
resources :subjects

# Provides the above and `delete`.
resources :subjects do
    # operates on an existing member of the resource,
    # i.e. expect to receive a member :id in the URL
    member do
        get :delete
    end
    
    # DOES NOT operate on an existing member
    # i.e. DOES NOT expect to receive a member :id in the url
    controller do
        get :export
    end
end

# Provides `index`, `new`, `create`, `update` BUT NOT `show`
resources :admin_users, except: [:show]

# Provides `index` and `show` ONLY
resources :products, only: [:index, :show]

```
