WPTools4Xserver
====

概要

Xserver(https://www.xserver.ne.jp/) 上で、主に WordPress の管理・運用で省力化出来る箇所をスクリプトとして纏めました。

## Description

シェルスクリプトで実行できるようにしてあります。

### backupErrorLog.sh
削除されない領域に、エラーログをバックアップします。cron などで定期実行することをオススメします。Xserver のログは、説明(https://www.xserver.ne.jp/manual/man_server_log.php)にある通り、夜中に内容が消されてしまうため作成した。

### backupwpfiles.sh
WordPress がインストールされているパスを、まるごと tar ball に固めて、~/backup ディレクトリ以下に、環境名(後述)と作成時刻のファイル名で保存する。

### deployBasic.sh
頻繁にテンプレートを更新する時に使う。git の使用前提。
ブランチ名とハッシュ値を表示することができるので、不具合があるときのコード特定の一助となる。
githashbranch.php が自動生成されるので、固定ページなどに関連付けるといいだろう。

### dumpmysql4xserver.sh
文字通り。MySQL の dump ファイルを取得する。実行すると、*mysqldump_環境名_時刻.sql* を生成する。

### restore2env.sh
特定の MySQL データベースにダンプファイルを復元するスクリプト。

### replaceWpConfigs.sh
本番環境の、mysql ダンプファイル、tar ball をデバッグ環境などに復元した時に、wp-config.php を書き換えるためのスクリプト。

### sample.wptoolsrc
スクリプト群で使う変数を定義するサンプル。実際には .wptoolsrc にリネームして中身を環境ごとに修正して使用する。

### updateQuery4MovingWP.sh
WordPress を異なるドメインやパスに復元して用いる場合に MySQL で実行するクエリを吐く。sql ファイルにして phpMyAdmin や、mysql に食わせると良いだろう。

### wpall4xserver.sh
cron などで定期実行することをオススメします。backupwpfiles.sh と dumpmysql4xserver.sh を実行する。~/backup ディレクトリにあるファイルのうち、古いファイルから順番に削除を行う。

## Requirement

deployBasic.sh では、http://vdeep.net/xserver-git などを参考に、git の導入が必要です。
ssh-agent を、agent forwarding ありで使用すると便利かも。

dumpmysql4xserver.sh では、ホームディレクトリの直下に、chmod で他人に見せないように権限を変更してある my-client.cnf と、my.cnf が必要。
my-client.cnf は mysql コマンドで使用。my.cnf は、mysqldump コマンドで使用。
サンプルを追加したほうが良いかもしれない。



## Usage
### deployBasic.sh
WordPress が /home/example/example.com/public_html/blog にインストール済みで、ブランチ名が master の場合

$ deployBasic.sh blog master

で、デプロイが可能。使い方にくせがあるので使用する際にはコードを読んで欲しい。今後修正するかもしれない。



## Install

## Contribution

## Licence

MIT ライセンスに準ずる。

## Author

Tatsuya Shimizu(cleanwater.super@gmail.com)
