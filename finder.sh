#!/bin/bash

# Find searchString in Files located in and 
# below searchDirectory
# USAGE
# give it an ABSOLUTE path ending in /
# e.g. /home/name/here/to/search/
# 	AND
# a search string to look for
# e.g. "looking For You"
# give it -q flag if it should be quiet
# will only print matching file names, not content
# NOTE: redirect stderr by 2>/dev/null
# e.g. finder /where/to/look/ whatFor 2>/dev/null

path=$1
search=$2
quiet=$3

for filename in `ls -p $path` #`ls -Rp|tail -n +2` 
	do
	# echo $filename
	# echo $search
	if echo $filename|grep '/' -q
		then
		# echo 'having a folder here'
		newpath=`echo $filename|tr ':' '/'`
		# echo $newpath
		finder $path$newpath "$search" $quiet
		continue
	fi
	if [[ ${filename##*.} == *[oha]* ]]
	then 
		# echo "ignoring" $filename
		continue
	fi
	if cat $path$filename| grep -F "$search" $quiet
		then
		# echo 'match in:'
		echo $path$filename
	fi
done
