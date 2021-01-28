---
layout: post
title:  "Move files to backup and back out"
date:   "Thu 28 Jan 11:19:52 AEDT 2021"
tags: [linux, sed]
---
To append ".bak" to files in a list:

```sh
for FILE in (cat failing_specs.txt);
  mv $FILE "$FILE.bak"
end
```

To remove the ".bak" suffix:

```sh
for FILE in (find spec/* -name "*.bak");
  echo "$FILE" | sed 's/\.bak//'
end

```
