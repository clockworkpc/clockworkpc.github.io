---
layout: post
title:  A Modest Start in BASH and NVIM
date:   Sat 21 Mar 17:40:29 AEDT 2020
tags: [bash, vim, scripting]
---

Instead of using Ruby and Atom to write a "create post" script, I decided to do it in `bash` and `nvim` instead.  I'm still getting used to the vim keybinding, but I'm really enjoying climbing the learning curve, and there's something, well, empowering about learning how to interact more directly with the system in BASH.

I could have easily written the following script in Ruby in a fraction of the time, but in the process I've learned a few thing about shell scripting.

On the whole, it's just a lot more satisfying.

```sh
#!/bin/bash

ymlTemplate=$(cat _front_matter_template.yml)
currentDate=`date`
dateStamp=`date +"%Y"-%m-%d-`
myTitle=$1
myTags=$2

# Generate YAML front matter by sub-string replacement
myYml="${ymlTemplate/MY_TITLE/$myTitle}"
myYml="${myYml/MY_DATE/$currentDate}"
myYml="${myYml/MY_TAGS/$myTags}"

myBasename="${myTitle,,}"
myBasename=`echo $myBasename | sed 's/[^a-zA-Z0-9]/_/g' | sed -e 's/\([_]\)\1\+/\1/g'`

filePath="`pwd`/_posts/${dateStamp}${myBasename}.md"

if [[ -z "$myTitle" ]] ; then
  echo "No title provided"
elif [[ -z "$myTags" ]] ; then
  echo "No tags provided"
else
  echo "${myYml}" > $filePath
  nvim "${filePath}"
  glow "${filePath}"
fi
```

If you're wondering, this is the YAML template:

```
---
layout: post
title:  MY_TITLE
date:   MY_DATE
tags: [MY_TAGS]
---
```
