---
layout: post
title:  Hidden PATCH Request in Rails
date:   Tue 31 Mar 12:35:03 AEDT 2020
tags: [rails, post, patch, rest]
---
## View

```erb
<%= form_for(@subject) do |f| %>

<table summary="Subject fmrm fields">
    <tr>
        <th>Name</th>
        <td><%= f.text_field(:name) %></td>
    </tr>
    <tr>
        <th>Position</th>
        <td><%= f.text_field(:position) %></td>
    </tr>
    <tr>
        <th>Visible</th>
        <td><%= f.text_field(:visible) %></td>
    </tr>
</table>

<div class="form-buttons">
<%= f.submit("Update Subject") %>
</div>

<% end %>
```

## Rendered HTML

```html
<form class="edit_subject" id="edit_subject_76" action="/subjects/76" accept-charset="UTF-8" method="post">
<input type="hidden" name="_method" value="patch">
<input type="hidden" name="authenticity_token" value="oCDkPYIyZRnpIVKN4B0Te9Wj0p6ck60iz3bz3bEPUGnAGjPcq1bm8Pc+IQD+SjxEhsQUVWvHTuNXFtN1l4zOag==">

...

</form>
```

### POST Input

```html
<form class="edit_subject" id="edit_subject_76" action="/subjects/76" accept-charset="UTF-8" method="post">
```

### PATCH Hidden Input

```html
<input type="hidden" name="_method" value="patch">
```
