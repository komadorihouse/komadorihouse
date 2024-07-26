# ベースイメージとしてRuby 2.6.5を使用
FROM ruby:3.0.2

# Node.jsとYarnをインストール（Webpackerのため）
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g yarn

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 作業ディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerをインストール
RUN gem install bundler:2.3.5

# Gemのインストール
RUN bundle install

# アプリケーションのコードをコピー
COPY . /myapp
