---
layout: post
title:  Resourceful URL Helpers in Rails
date:   Tue 31 Mar 06:24:57 AEDT 2020
tags: [rails, rest, routes]
---
## Verbs, URLs, Actions, and URL Helpers

| Verb   | URL                  | Action  | URL Helper                   |
|--------|----------------------|---------|------------------------------|
| GET    | /subjects            | index   | **subjects_path**            |
| POST   | /subjects            | create  | **subjects_path**            |
| GET    | /subjects/:id        | show    | **subject_path(:id)**        |
| PATCH  | /subjects/:id        | update  | **subject_path(:id)**        |
| DELETE | /subjects/:id        | destroy | **subject_path(:id)**        |
| GET    | /subjects/new        | new     | **new_subject_path**         |
| GET    | /subjects/:id/edit/  | edit    | **edit_subject_path(:id)**   |
| GET    | /subjects/:id/delete | delete  | **delete_subject_path(:id)** |


## Full path and URL helper

```ruby
{controller: 'subjects', action: 'show', id: 5}

subject_path(5)
```

## Examples

```erb
# /subjects/index
<%= link_to('All Subjects', subjects_path) %>

# /subjects?page=3
<%= link_to('All Subjects', subjects_path(page: 3)) %>

# /subjects/10
## @subject.id = 10
<%= link_to('Show Subject', subject_path(@subject.id)) %>

## .id is optional
<%= link_to('Show Subject', subject_path(@subject)) %>

# /subjects/10?format=verbose
<%= link_to('Show Verbose Subject',
    subject_path(@subject.id, format: 'verbose')) %>

# /subjects/10/edit/
<%= link_to('Edit Subject', edit_subject_path(@subject.id)) %>
```
