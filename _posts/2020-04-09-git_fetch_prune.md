---
layout: post
title:  git fetch --prune
date:   Thu  9 Apr 14:23:30 AEST 2020
tags: [git, version_control, workflow]
---
A very handy git command is `git fetch --prune`.

For example, there were quite a few branches that had been deleted from remote, and also on local, but which still showed up when I tab-completed on my local:

```sh

$ git checkout BE_
BE_api_documentation_FEATURE_1mrttw   BE_routes_controllers_FIX_1mweqd
BE_collection_csv_FEATURE_1mrtux       BE_rswag_FIX_1mwvhk
BE_email_messages_FEATURE_1mrtuu       BE_rubocop_FIX_1mvrf0
BE_haikunator_FEATURE_1mumnd          BE_sanity_check_FIX_1mw7h0
BE_haikunator_FIX_1mwm8v              BE_scope_teams_users_FEATURE_1mwvhq

```

So I ran this command:

```sh
$ git fetch --prune
From github.com:chameleoncreator/chameleon_feedback
 - [deleted]         (none)     -> origin/BE_api_documentation_FEATURE_1mrttw
 - [deleted]         (none)     -> origin/BE_collection_csv_FEATURE_1mrtux
 - [deleted]         (none)     -> origin/BE_haikunator_FEATURE_1mumnd
 - [deleted]         (none)     -> origin/BE_haikunator_FIX_1mwm8v
 - [deleted]         (none)     -> origin/BE_routes_controllers_FIX_1mweqd
 - [deleted]         (none)     -> origin/BE_rubocop_FIX_1mvrf0
 - [deleted]         (none)     -> origin/BE_sanity_check_FIX_1mw7h0
 - [deleted]         (none)     -> origin/api_doc_FEATURE_1mrttw
 - [deleted]         (none)     -> origin/collection_responses_api_endpoint_FEATURE_1mrttu
 - [deleted]         (none)     -> origin/create_collections_ui_FEATURE_1mr8nw
 - [deleted]         (none)     -> origin/fix_routes_err_FEATURE_1mupbr
 - [deleted]         (none)     -> origin/make_current_tests_pass_FEATURE_1mu69g
 - [deleted]         (none)     -> origin/make_deployment_happen_with_dev-FEATURE-1mwpye
 - [deleted]         (none)     -> origin/quick-brand-update-FEATURE-1mwfft
```

And now when I tab-complete a `git checkout`:


```sh

$ git checkout BE_
BE_email_messages_FEATURE_1mrtuu      BE_scope_teams_users_FEATURE_1mwvhq
BE_rswag_FIX_1mwvhk

```
