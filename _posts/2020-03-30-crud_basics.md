---
layout: post
title:  CRUD Basics
date:   Mon 30 Mar 22:09:33 AEDT 2020
tags: [crud, api, rails]
---
## Standard CRUD Actions in Rails

| CRUD   | Action  | Description                 | Example URL           | HTTP Verb |
|--------|---------|-----------------------------|-----------------------|-----------|
| CREATE | new     | Display new record form     | /subjects/new         | GET       |
| CREATE | create  | Process new record form     | /subjects/create      | POST      |
| READ   | index   | List records                | /subjects             | GET       |
| READ   | show    | Display a single record     | /subjects/show/:id    | GET       |
| UPDATE | edit    | Display an edit record form | /subjects/edit/:id    | GET       |
| UPDATE | update  | Process edit record form    | /subjects/update/:id  | PATCH/PUT |
| DELETE | delete  | Display delete record form  | /subjects/delete/:id  | GET       |
| DELETE | destroy | Process delete record form  | /subjects/destroy/:id | DELETE    |

Useful resource: https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
