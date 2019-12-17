FROM ruby:2.5.3-alpine
 
RUN \
apk add --no-cache --virtual build-dependencies --update \
    build-base \
    linux-headers \
    tzdata \
    nodejs \
    yarn \
    sqlite-dev
 
ENV APP_ROOT /app
 
RUN mkdir ${APP_ROOT}
 
WORKDIR ${APP_ROOT}
 
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
 
RUN gem install bundler && bundle install
 
ADD . ${APP_ROOT}
 
# 解放ポート
EXPOSE 80
 
# 環境変数毎のエンドポイント
ARG RAILS_ENV
ENTRYPOINT ["/bin/sh", "-c","/app/script/entrypoint_${RAILS_ENV}.sh" ]
