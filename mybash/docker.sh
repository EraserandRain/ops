docker-run-centos='docker run --rm -d -p800:80 --name mycentos --privileged -v ~/wsl-testing/web:/usr/share/nginx -v ~/wsl-testing/web/nginx:/etc/nginx -it eraserandrain/centos:nginx /bin/bash'
