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
  echo "# ${myTitle}" >> ${filePath}
  nvim "${filePath}"
  glow "${filePath}"
fi

