---
layout: post
title:  POST Form Basics
date:   Tue 31 Mar 07:39:57 AEDT 2020
tags: [rest, http, rails]
---
## Form Arrays

## Front End

### Standard HTML

```html
<form action="/subjects" method="post">
    <input type="text" name="subject[name]">
    <input type="text" name="subject[position]">
    <input type="text" name="subject[visible]">
    
    <input type="submit" value="Create Subject">
</form>
```

### ERB with URL Helpers

```erb
<%= form_for(@subject) do |f| %>

    <%= f.text_field(:name) %>
    <%= f.text_field(:position) %>
    <%= f.text_field(:visible) %>

    <%= f.submit("Create Subject") %>
<% end %>
```

## Rails

```ruby
params[:subject][:name]
params[:subject][:position]
params[:subject][:visible]

params[:subject]
#=> { :name => 'About Us', :position => '5', :visible => '1' }

subject = Subject.new(params[:subject])
```
