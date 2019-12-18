FROM ruby:2.6.5-alpine
 
RUN apk add --no-cache --virtual build-dependencies --update \
    build-base \
    linux-headers \
    tzdata \
    nodejs \
    yarn \
    sqlite-dev
 
ENV APP_ROOT /app
RUN mkdir ${APP_ROOT}
ADD . ${APP_ROOT}
WORKDIR ${APP_ROOT}
RUN gem install bundler && bundle install
RUN yarn install --check-files
 
