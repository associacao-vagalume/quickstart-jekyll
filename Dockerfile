FROM ruby:2.4.2-slim-jessie

COPY . /srv/jekyll
WORKDIR /srv/jekyll

RUN apt-get update; \
    apt-get install -y cmake apache2 ; \
    apt-get clean && rm -rf /var/lib/apt/lists/* ; \

    gem install bundler ; \
    bundle install ; \
    bundle exec jekyll build ; \
    cp -r ./_site/* /var/www/html/ ; \

    echo "#!/bin/bash" > /usr/local/bin/httpd-foreground ; \
    echo "set -e" >> /usr/local/bin/httpd-foreground ; \
    echo "rm -f /usr/local/apache2/logs/httpd.pid" >> /usr/local/bin/httpd-foreground ; \
    echo "exec apachectl -DFOREGROUND" >> /usr/local/bin/httpd-foreground ; \
    chmod +x /usr/local/bin/httpd-foreground ; \

    ln -sf /proc/self/fd/1 /var/log/apache2/access.log ; \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80
CMD ["/usr/local/bin/httpd-foreground"]