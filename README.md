WPTools4Xserver
====

概要

Xserver(https://www.xserver.ne.jp/) 上で、主に WordPress の管理・運用で省力化出来る箇所をスクリプトとして纏めました。

## Description

シェルスクリプトで実行できるようにしてあります。

### backupErrorLog.sh
削除されない領域に、エラーログをバックアップします。cron などで定期実行することをオススメします。Xserver のログは、URL にある通り、夜中に内容が消されてしまうため、このスクリプトを作成しました。
https://www.xserver.ne.jp/manual/man_server_log.php

### backupwpfiles.sh
WordPress がインストールされているパスを、まるごと tar ball に固めて、~/backup ディレクトリ以下に、環境名(後述)と作成時刻のファイル名で保存します。

### deployBasic.sh
頻繁にテンプレートを更新する時に使う。git の使用が前提です前提です。
ブランチ名とハッシュ値を含んだ php のコード、githashbranch.php を自動生成するので、不具合があるときのコード特定の一助となるでしょう。

### dumpmysql4xserver.sh
文字通り。MySQL の dump ファイルを取得します。実行すると、*mysqldump_環境名_時刻.sql* を生成します。

### restore2env.sh
特定の MySQL データベースにダンプファイルを復元するスクリプト。

### replaceWpConfigs.sh
本番環境の、mysql ダンプファイル、tar ball をデバッグ環境などに復元した時に、wp-config.php を書き換えるためのスクリプト。

### sample.wptoolsrc
スクリプト群で使う変数を定義するサンプル。実際には .wptoolsrc にリネームして中身を環境ごとに修正して使用します。

### updateQuery4MovingWP.sh
WordPress を異なるドメインやパスに復元して用いる場合に MySQL で実行するクエリを吐きます。sql ファイルにして phpMyAdmin や、mysql に食わせて使うことを想定。

### wpall4xserver.sh
cron などで定期実行することをオススメします。backupwpfiles.sh と dumpmysql4xserver.sh を実行します。~/backup ディレクトリにあるファイルのうち、古いファイルから順番に削除を行います。

## Requirement

deployBasic.sh では、http://vdeep.net/xserver-git などを参考に、git の導入が必要です。
ssh-agent などを、agent forwarding ありで使用すると便利です。

dumpmysql4xserver.sh では、ホームディレクトリの直下に、chmod で他人に見せないように権限を変更してある my-client.cnf と、my.cnf が必要です。my-client.cnf は mysql コマンドで使用。my.cnf は、mysqldump コマンドで使用。今後、サンプルを追加するかもしれません。



## Usage
### deployBasic.sh
WordPress が /home/example/example.com/public_html/blog にインストール済みで、ブランチ名が master の場合

$ deployBasic.sh blog master

で、デプロイが可能。使い方にくせがあるので使用する際にはコードを読んで欲しいです。今後修正するかもしれません。



## Install

## Author

Tatsuya Shimizu(https://github.com/cleanwater-super)
