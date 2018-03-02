FROM httpd
LABEL maintainer=milobahg
COPY proxy-ssl.conf /usr/local/apache2/conf/extra/proxy-ssl.conf
COPY proxy-http.conf /usr/local/apache2/conf/extra/proxy-http.conf
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY cert.crt /usr/local/apache2/conf/server.crt
COPY key.key /usr/local/apache2/conf/server.key
#COPY chain.crt /usr/local/apache2/conf/server-ca.crt 
EXPOSE 443 80
CMD httpd-foreground
