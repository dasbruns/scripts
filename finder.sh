#!/bin/bash

# Find searchString in Files located in and 
# below searchDirectory
# USAGE
# give it an ABSOLUTE path ending in /
# e.g. /home/name/here/to/search/
# 	AND
# a search string to look for
# e.g. lookingForYou
# NOTE: redirect stderr by 2>null
# e.g. finder /where/to/look/ whatFor 2>null

path=$1
search=$2
# echo $path

for filename in `ls -p $path` #`ls -Rp|tail -n +2` 
	do
	# echo $filename
	# echo $search
	if echo $filename|grep '/' -q
		then
		# echo 'having a folder here'
		newpath=`echo $filename|tr ':' '/'`
		# echo $newpath
		finder $path$newpath $search	
		continue
	fi
	if cat $path$filename| grep $search -q
		then
		# echo 'match in:'
		echo $path$filename
	fi
done
