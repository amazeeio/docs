FROM amazeeio/centos7-nginx:1.10

COPY docker/docs.conf /etc/nginx/sites

EXPOSE 8080
