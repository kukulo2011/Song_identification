#!/bin/sh

OutputDirectory='/home/YOUR_USER/Audio2/'

for file in /home/YOUR_USER/Audio/*
    do
      if [ -f "$file" ];then
       echo "$file";
	./echoprint-codegen "$file" 10 60 >json_string.json
	VAR1=$(curl -X POST -H "Content-Type:application/octet-stream" "http://api.mooma.sh/v1/song/identify?api_key=GET_YOUR_API_KEY_AT_MOOMA.SH" --data-binary "@json_string.json") 
	echo $VAR1
	Artist=$(echo $VAR1|grep -Po '(?<="artist_name":")[^"]*')
 	Title=$(echo $VAR1|grep -Po '(?<="title":")[^"]*')
	Album=$(echo $VAR1|grep -Po '(?<="album":")[^"]*')
	TrackNo=$(echo $VAR1|grep -Po '(?<="title":")[^"]*')
	echo $Artist
	echo $Title
	Space='-'
	Point='.'
	filename=$(basename "$file")
	extension="${filename##*.}"
	Newfilename=$Artist$Space$Title$Point$extension
	echo $filename
	echo $extension
	echo $Newfilename
	Newfile=$OutputDirectory$Newfilename
	if [ -n "$Artist" ] && [ -n "$Title" ] ; then
		mv "$file" "$Newfile"
		echo "Rename succesful please check the "$OutputDirectory" for the result."
	else
    		echo "Unidentified song, leaving file untouched in the input directory."
	fi
	if [ $extension="mp3" ] && [ -n "$Artist" ]; then
	eyeD3 -a "$Artist" -t "$Title" "$Newfile"	
	fi
	
      fi

done
