---
layout: post
title:  Extract Rails Routes with egrep and sort
date:   Fri 10 Apr 07:53:33 AEST 2020
tags: [bash, grep, scripting]
---
Let's say you have the following Rails routes:

```sh
Prefix Verb   URI Pattern                                                                              Controller#Action
                              authors GET    /authors(.:format)                                                                       authors#index
                                      POST   /authors(.:format)                                                                       authors#create
                           new_author GET    /authors/new(.:format)                                                                   authors#new
                          edit_author GET    /authors/:id/edit(.:format)                                                              authors#edit
                               author GET    /authors/:id(.:format)                                                                   authors#show
                                      PATCH  /authors/:id(.:format)                                                                   authors#update
                                      PUT    /authors/:id(.:format)                                                                   authors#update
                                      DELETE /authors/:id(.:format)                                                                   authors#destroy
                       delete_subject GET    /subjects/:id/delete(.:format)                                                           subjects#delete
                             subjects GET    /subjects(.:format)                                                                      subjects#index
                                      POST   /subjects(.:format)                                                                      subjects#create
                          new_subject GET    /subjects/new(.:format)                                                                  subjects#new
                         edit_subject GET    /subjects/:id/edit(.:format)                                                             subjects#edit
                              subject GET    /subjects/:id(.:format)                                                                  subjects#show
                                      PATCH  /subjects/:id(.:format)                                                                  subjects#update
                                      PUT    /subjects/:id(.:format)                                                                  subjects#update
                                      DELETE /subjects/:id(.:format)                                                                  subjects#destroy
        rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
        rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
           rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
        rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
         rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
       rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
                                      POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
    new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
   edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
        rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
                                      PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
                   rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
            rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
                   rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
            update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
                 rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

```

And you want to extract the **Verb** and **URI Pattern** for `subjects` and `authors`, and then sort the results by Verb.

```sh
$ rails routes \
| egrep -o '([A-Z]+)\s+\/(subjects|authors).*\s' \
| sed 's/\s*$//' \
| sort \
| xclip -selection c

DELETE /authors/:id(.:format)
DELETE /subjects/:id(.:format)
GET    /authors(.:format)
GET    /authors/:id/edit(.:format)
GET    /authors/:id(.:format)
GET    /authors/new(.:format)
GET    /subjects(.:format)
GET    /subjects/:id/delete(.:format)
GET    /subjects/:id/edit(.:format)
GET    /subjects/:id(.:format)
GET    /subjects/new(.:format)
PATCH  /authors/:id(.:format)
PATCH  /subjects/:id(.:format)
POST   /authors(.:format)
POST   /subjects(.:format)
PUT    /authors/:id(.:format)
PUT    /subjects/:id(.:format)


```

## Explanation

| Command                 | Meaning                                    |
|-------------------------|--------------------------------------------|
| `rails routes`          | return all the routes in the Rails project |
| `egrep`                 | grep with extended regex                   |
| `-o`                    | only matching                              |
| `([A-Z]+)`              | a string of capital letters, e.g. **POST** |
| `\s+`                   | any number of whitespaces                  |
| `\/(subjects\|authors)` | either **/subjects** or **/authors**       |
| `.*\s`                  | any characters followed by whitespace      |
| `sed 's/\s*$//'`        | remove trailing whitespaces                |
| `sort`                  | sort by alphabetical order                 |
| `xclip -selection c`    | copy to the clipboard                      |

*NOTE*: In the grep it is `subjects|authors`, not `subjects\|authors`.  My markdown table formatter was reading `|` as a column delimiter.
