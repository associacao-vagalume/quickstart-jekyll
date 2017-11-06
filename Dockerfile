FROM httpd:2.4

COPY ./_site/ /usr/local/apache2/htdocs/

RUN ls -r /usr/local/apache2/htdocs/

CMD ["/usr/local/bin/httpd-foreground"]
