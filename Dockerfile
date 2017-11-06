FROM httpd:2.4

COPY ./_site/ /usr/local/apache2/htdocs/

RUN ln -sf /var/www /usr/local/apache2/htdocs/

CMD ["/usr/local/bin/httpd-foreground"]
