# Epaper Downloader for Annapurnapost
Enough of these awful ads and unnecessary ****** on these media webpages. I wanted to view today's epaper without going to their heavy and ugly website. So I wrote this bash script. This was tested in Debian testing/sid machine and works quite well. Here's my machine. 
![N|Solid](https://i.imgur.com/PuXS8sW.png)

This script downloads a webpage, `grep`s to find the required links to epapers and `wget`s to the desktop folder "Annapurnapost". Enjoy at your own risk!

# HOW TO
  - Download the source code and save it somewhere.
  - `chmod x /path/to/the/file`.
  - Double click that file and everything will be done automagically!

You can also add a  `cron` job to run the script automatically but be aware that they don't upload new paper early everyday. You might just have an old paper for a few days.

Here's an screenshot of the script running. Nothing much to see though :D
![N|Solid](https://i.imgur.com/JE2BADI.png)

Suggestions, PRs very welcome!
