#!/bin/bash
apt update && apt upgrade --assume-yes
apt-get install docker.io git --assume-yes
systemctl enable docker && systemctl start docker && clear && echo "Docker Installed and enabled"

docker network create \
  --driver=bridge \
  --subnet=240.240.240.0/16 \
  --ip-range=240.240.240.0/24 \
  --gateway=240.240.240.0 \
  vulnerable 

echo "Pulling Scoreboard" \
&& docker pull iamgavinj/ctfscoreboard && clear && echo "Scoreboard Downloaded, Pulling Juice-Shop" \
&& docker pull bkimminich/juice-shop && clear && echo "Juice Shop downloaded, Pulling bWAPP" \
&& docker pull raesene/bwapp && clear && echo "bWAPP Downloaded, Pulling DVWA" \
&& docker pull vulnerables/web-dvwa && clear && echo "DVWA Downloaded, Pulling NoWasp" \
&& docker pull citizenstig/nowasp && clear && echo "NoWasp Downloaed, Pulling SQLi Labs" \
&& docker pull acgpiano/sqli-labs:latest && clear && echo "Docker containers pulled"
docker run -d --network=vulnerable --ip 240.240.240.3 -p 8181 iamgavinj/ctfscoreboard && clear && echo "Scoreboard Initiated" \
&& docker run -d --rm --network=vulnerable --ip 240.240.240.4 -p 3000:3000 bkimminich/juice-shop && clear && echo "Juice Shop Initiated" \
&& docker run -d --rm --network=vulnerable --ip 240.240.240.5 -p 90:90 raesene/bwapp && clear && echo "bWAPP Initiated" \
&& docker run -d --rm --network=vulnerable --ip 240.240.240.6 -p 100:100 vulnerables/web-dvwa && clear && echo "DVWA Initiated" \
&& docker run -d --network=vulnerable --ip 240.240.240.7 -p 120:120 acgpiano/sqli-labs:latest && clear && echo "SQLi Labs Initiated"
&& docker run -d --network=vulnerable --ip 240.240.240.2 -p 8080:8080 -p 9090:9090 -e TZ=Europe/London webgoat/goatandwolf && clear && echo "WebGoat initiated" 
echo "Setup complete all services are running. Check documentation for further details"
