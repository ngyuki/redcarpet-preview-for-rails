# Install

ソースファイルを Git で取得します。

    git clone git://github.com/ngyuki/redcarpet_markdown_editor.git
    cd redcarpet_markdown_editor

（もし未インストールなら）bundle をインストールします。

    gem install bundler

bundle で依存パッケージをインストールします。

    bundle install --path vendor/bundle

WEBrick で試しに実行してみます。

    bundle exec rails s

実運用で Passenger などで動かす場合は Rails を実行するユーザが log, tmp に書込可能な必要があります。

    mkdir -p log tmp
    sudo chown -R nobody:nobody log tmp
    sudo chmod -R 755 log tmp
