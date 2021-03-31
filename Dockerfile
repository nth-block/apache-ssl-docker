FROM httpd:latest
COPY fullchain1.pem /usr/local/apache2/conf/server.crt
COPY privkey1.pem /usr/local/apache2/conf/server.key
RUN sed 's/^#ServerName.*$/ServerName splunk.nthblock.org:80/g' conf/httpd.conf > conf/httpd.conf.bkup  && mv conf/httpd.conf.bkup conf/httpd.conf  && sed '/httpd-ssl.conf/s/^#//' conf/httpd.conf > conf/httpd.conf.bkup  && mv conf/httpd.conf.bkup conf/httpd.conf && sed '/mod_ssl\.so/s/^#//' conf/httpd.conf > conf/httpd.conf.bkup  && mv conf/httpd.conf.bkup conf/httpd.conf  && sed '/mod_socache_shmcb.so/s/^#//' conf/httpd.conf > conf/httpd.conf.bkup  && mv conf/httpd.conf.bkup conf/httpd.conf && sed 's/^ServerName.*$/ServerName splunk.nthblock.org:443/g' conf/extra/httpd-ssl.conf  > conf/extra/httpd-ssl.conf.bkup  && mv conf/extra/httpd-ssl.conf.bkup conf/extra/httpd-ssl.conf  && chmod 600 /usr/local/apache2/conf/server.key
EXPOSE 80
EXPOSE 443
CMD ["httpd-foreground"]
