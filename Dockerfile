FROM bitnami/ruby:2.5

RUN apt-get update && apt-get install -y libmariadb-dev
RUN apt-get install -y vim
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash -
RUN apt-get -y install nodejs
RUN npm install -g yarn
RUN gem install rails

WORKDIR /app

RUN rm -rf /app
COPY . /app
RUN bundle install

EXPOSE 3000