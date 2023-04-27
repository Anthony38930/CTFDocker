# CTFDocker

The script will automatically install Docker to the host system, create a vulnerable network in which users can join to participate in either challenges.

The scoreboard will require setting up, a later addition might be to incorporate all the challenges available into the scoreboard so that this doesn't need to be entered at the start of each fresh event.

Challenges are on the ports and IP addresses below. I want to have this all changed and uniform at port 80 on each designated IP address, this will be done over the coming weeks.

240.240.240.4 -p 3000:3000 bkimminich/juice-shop
240.240.240.5 -p 90:90 raesene/bwapp
240.240.240.6 -p 100:100 vulnerables/web-dvwa
240.240.240.7 -p 120:120 acgpiano/sqli-labs:latest 
240.240.240.2 -p 8080:8080 -p 9090:9090 -e TZ=Europe/London webgoat/goatandwolf

From testing there are some errors getting a couple of these frameworks running, further testing will result in these being fixed. 
