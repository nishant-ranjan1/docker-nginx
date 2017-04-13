FROM debian:jessie 
MAINTAINER NGINX Docker Mainainers "nishantshrivastava1@gmail.com"
ENV NGINX_VERSION 1.11.10~jessie  
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    &&  echo "deb http://nginx.org/packages/mainline/debian jessie nginx" >> /etc/apt/sources.list \ 
    &&  apt-get update \ --update apt cache burst
    $$  apt-get install --no-install-recommends --no-install-suggests -y \ 
                             ca-certificates -- packages to install
                             nginx=${NGINX_VERSION} \ 
                             nginx-module-xslt \
                             nginx-module-geoip \
                             nginx-module-image-filter \
                             nginx-module-perl \
                             nginx-module-njs \
                             getext-base \
             && rm -rf /var/lib/apt/lists/*
RUN ln -sf /dev/stdout /var/log/nginx/access.log \  
RUN ln -sf /dev/stderr /var/log/nginx/error.log 

EXPOSE 80 443  
CMD ["nginx","-g","daemon off;"] 

