# Epaper Downloader for Annapurnapost
Enough of these awful ads and unnecessary ****** on these media webpages. I wanted to view today's epaper without going to their heavy and ugly website. So I wrote this bash script. You can create a new `cron` job to run this script every morning. This was tested in Debian testing/sid machine and works quite well. Here's my machine. 
![N|Solid](https://i.imgur.com/PuXS8sW.png)

This script downloads a webpage, `grep`s to find the required links to epapers and `wget`s to the desktop folder "Annapurnapost". Enjoy at your own risk!

Here's an screenshot of the script running. Also keep in mind that I've removed `-q` (quiet) option for `wget` to demonstrate.
![N|Solid](https://i.imgur.com/55gB8zA.png)

Suggestions, PRs very welcome!
