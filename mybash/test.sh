#!/bin/bash
export LC_ALL=C

exit 0


docker-run-nginx='cd ~/wsl-testing/mydocker&&docker run --rm -d -p800:80 --name mynginx --privileged -v /home/eraserrain/wsl-testing/mydocker/html:/usr/share/nginx/html -v /home/eraserrain/wsl-testing/mydocker/nginx:/etc/nginx -it eraserandrain/centos:nginx /bin/bash'
dockergo='sudo service docker restart'
dockerstop='sudo service docker stop'

https://www.google.com/search?q=RFC1918
https://zh.wikipedia.org/wiki/%E4%B8%93%E7%94%A8%E7%BD%91%E7%BB%9C
https://zh.wikipedia.org/wiki/%E7%BD%91%E7%BB%9C%E5%9C%B0%E5%9D%80%E8%BD%AC%E6%8D%A2