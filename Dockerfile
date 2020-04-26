FROM ruby:2.7.1

RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get install -y wget unzip

RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
      && wget https://dl.google.com/linux/linux_signing_key.pub \
      && apt-key add linux_signing_key.pub \
      && apt-get update \
      && apt-get install -y google-chrome-stable

# ENV DISPLAY=:99

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle config path --global vendor/bundle/ \
      && bundle install

ADD main.rb .

CMD ["bundle", "e", "ruby", "main.rb"]
