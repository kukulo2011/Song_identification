# Song identification shell script
Song identification script for echoprint codegen and Mooma.sh service

Requirements: Linux or Mac
              echoprint-codegen program from http://echoprint.me/
              Mooma.sh API key from http://www.mooma.sh/api.html 
              eyeD3 tagging python program http://eyed3.nicfit.net/ (optional)
              
What the script does: It takes each file from /home/YOUR_USER/Audio/, runs echoprint-codegen on the file, sends the json output to Mooma.sh service for song identification. When it receives response, moves, renames the file to the output directory and writes an ID tag for mp3 files.
When getting your Mooma.sh key please let know the mooma.sh administrator that you will need to identify approx. 1 song/second. The Mooma.sh service is still beta and there is a limitation on the API currently.


              
