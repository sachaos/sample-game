FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nginx liblua5.1-0
RUN echo "mysql-server mysql-server/root_password password root3289" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root3289" | debconf-set-selections
RUN apt-get -y install mysql-server
RUN mkdir -p /var/www/app
WORKDIR /var/www/app
ADD Gemfile /var/www/app/Gemfile
ADD Gemfile.lock /var/www/app/Gemfile.lock
RUN gem install bundler
VOLUME /var/www/app
ADD . /var/www/app
RUN bundle install

expose 80

ENV LUA_LIB=/usr/lib/x86_64-linux-gnu/liblua5.1.so.0

ADD conf.d/local.conf /etc/nginx/conf.d/local.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["/bin/sh", "/var/www/app/init.sh"]
