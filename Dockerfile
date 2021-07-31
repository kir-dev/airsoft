FROM ruby:3.0.2

RUN mkdir /airsoft
WORKDIR /airsoft

RUN gem install bundler -v 2.1.4
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --retry 3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn -y

COPY . .

RUN yarn install --check-files
RUN rails assets:precompile

