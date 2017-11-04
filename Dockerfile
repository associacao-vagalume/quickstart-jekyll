FROM httpd:2.4

COPY . /jekyll

RUN apt-get update; \
    apt-get install gcc cmake ruby-full rake libffi-dev zlib1g-dev -y; \
    gem install bundler ffi; \
    cd /jekyll && bundle install ; \
    bundle exec jekyll build ; \
    cp -r /jekyll/_site/* /usr/local/apache2/htdocs/

VOLUME  /jekyll