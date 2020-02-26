---
layout: post
title: "A Little Note on Git"
date: "2020-02-20"
author: "Alexander Garber"
tags: [git, devops]
---

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# Call it id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

You are now ready to `git clone` to your heart's content.