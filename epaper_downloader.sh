#!/bin/bash

#Before I start I will say that this is an ugly approach but still works.
#Also you can append all the "rm -f" lines at the bottom if it confuses you in the middle. It is just to clean the unwanted files after their job is done.
#Needs GNU Wget 1.16 or higher for progressbar options.


notify-send "Downloading homepage"
#Download webpage
wget "http://annapurnapost.com/epaper" -O /tmp/index.html -q 
notify-send "Searching for epaper link"
#We wanna grab the line <a href="http://annapurnapost.com/epaper/detail/465" title="Epaper Details"> which contains today's epaper link.
paper=$(cat /tmp/index.html | grep -E 'Epaper.*Details');
#remove the downloaded index file
rm -f /tmp/index.html
#write the variable paper to next file to extract the exact webpage link
echo "$paper" >> /tmp/link.txt 
#We now use regex matchng to find exact URLs of todays epaper page
link=$(cat /tmp/link.txt |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*");

rm -f /tmp/link.txt
#Download the webpage of above captured link. It has all the images!
#echo "The epaper is of the following date" 
notify-send "Downloading epaper webpage"
wget "$link" -O /tmp/epaper.html -q
#Search for links
notify-send "Searching for epaper images link"
papers=$(cat /tmp/epaper.html | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*")
rm -f /tmp/epaper.html
echo "$papers" > /tmp/papers.txt
#The links with todays epaper images appear to have "epaper/2017" extra in the URL. So let's search for that.
imglink=$(cat /tmp/papers.txt | grep "epaper/2017")
rm -f /tmp/papers.txt
#Output the found URLs to a file which is used by wget to download the images in the given directory.
echo "$imglink" > /tmp/imglink.txt
notify-send "Links found. Now dowloading epapers"
wget -i /tmp/imglink.txt -P "$HOME/Desktop/AnnapurnaPost" -q --show-progress
rm -f /tmp/imglink.txt
notify-send "Done. Check the folder AnnapurnaPost in your desktop."
