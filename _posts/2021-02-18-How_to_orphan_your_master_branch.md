---
layout: post
title:  "How to orphan your master branch"
date:   "Thu 18 Feb 08:55:12 AEDT 2021"
tags: [git]
---
I recently created a small Rails app to demonstrate delegated types, but when I pushed it to Github, the first commit included all the files in `tmp` and `node_modules`.

I removed them from the branch and pushed follow-up commits, but the history of these files remained in my Git history.

Here is an easy solution from [Stackoverflow](https://stackoverflow.com/questions/13716658/how-to-delete-all-commit-history-in-github):

```sh
# Checkout
git checkout --orphan latest_branch
# Add all the files
git add -A
# Commit the changes
git commit -am "orphaned master branch"
# Delete the branch
git branch -D master
# Rename the current branch to master
git branch -m master
# Finally, force update your repository
git push -f origin master
```
