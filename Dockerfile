# FROM ruby:2.6.5
# # リポジトリを更新し依存モジュールをインストール
# RUN apt-get update -qq && \
#     apt-get install -y build-essential \
#                        nodejs

# # yarnパッケージ管理ツールインストール
# RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
#     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#     apt-get update && apt-get install -y yarn

# # Node.jsをインストール
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
#     apt-get install -y nodejs

# # ルート直下にentertainerという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
# RUN mkdir /entertainer
# WORKDIR /entertainer

# # ホストのGemfileとGemfile.lockをコンテナにコピー
# ADD Gemfile /entertainer/Gemfile
# ADD Gemfile.lock /entertainer/Gemfile.lock

# # bundle installの実行
# RUN gem install bundler
# RUN bundle install

# # ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
# ADD . /entertainer

# # puma.sockを配置するディレクトリを作成
# RUN mkdir -p tmp/sockets