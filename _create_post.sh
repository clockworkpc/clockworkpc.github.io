#!/bin/bash

cd ~/Development/clockworkpc.github.io
ymlTemplate=$(cat _front_matter_template.yml)
targetTimezone="America/New_York"
currentDate=`TZ=$targetTimezone date`
dateStamp=`TZ=$targetTimezone date +"%Y"-%m-%d-`
myTitle=$1
myTags=$2

# Generate YAML front matter by sub-string replacement
myYml="${ymlTemplate/MY_TITLE/\"$myTitle\"}"
myYml="${myYml/MY_DATE/\"$currentDate\"}"
myYml="${myYml/MY_TAGS/$myTags}"

myBasename="${myTitle}"
myBasename=`echo $myBasename | sed 's/[^a-zA-Z0-9]/_/g' | sed -e 's/\([_]\)\1\+/\1/g'`

# filePath="`pwd`/_posts/${dateStamp}${myBasename}.md"
filePath="`pwd`/_posts/${dateStamp}${myBasename}.md"

if [[ -z "$myTitle" ]] ; then
  echo "No title provided"
elif [[ -z "$myTags" ]] ; then
  echo "No tags provided"
else
  nvim "${filePath}"
  glow "${filePath}"
  echo -e "${myYml}\n$(cat $filePath)" > $filePath
  git add .
  git commit -m "${myBasename}"
fi
