# Song identification shell script
Song identification script for echoprint codegen and Mooma.sh service

Requirements: 

Linux or Mac, 

echoprint-codegen program from http://echoprint.me/, 

Mooma.sh API key from http://www.mooma.sh/api.html, 

eyeD3 tagging python program http://eyed3.nicfit.net/ (optional)



What the script does: It takes each file from /home/YOUR_USER/Audio/, runs echoprint-codegen on the file, sends the json output to Mooma.sh service for song identification. When it receives response, moves, renames the file to the output directory and writes an ID tag for mp3 files.

When getting your Mooma.sh key please let know the mooma.sh administrator that you will need to identify approx. 1 song/second. The Mooma.sh service is still beta and there is a limitation on the API currently.

Installation on Ubuntu 14.04: 

 $ sudo apt-get install ffmpeg libboost1.54-dev libtag1-dev zlib1g-dev eyed3
  
  Then follow the guide at: https://github.com/echonest/echoprint-codegen/blob/release-4.12/README.md to install echoprint-codegen.
  
  Place the script into the same directory as echoprint codegen binary. Ensure you have write access to that directory.
  
 $ chmod +x  song_identification.sh
  
 $ mkdir ~/Audio
  
 $ mkdir ~/Audio2

Place your unrecognized audio files into Audio directory.
Edit the script adding the API key. Be sure you have requested 1 song/second throughput at mooma.sh.

Run the script:

$ ./song_identification.sh

              
