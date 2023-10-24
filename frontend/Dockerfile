FROM docker.io/nginxinc/nginx-unprivileged
# Setup app working directory
# WORKDIR /usr/share/nginx/html

RUN mkdir -p /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# https://stackoverflow.com/questions/54360223/openshift-nginx-permission-problem-nginx-emerg-mkdir-var-cache-nginx-cli
#RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
#    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx


COPY . ./
