# Zabbix のグラフを画像ファイルとして取得する

## 本スクリプトの動作
- 指定した Zabbix のグラフを画像として取得する
- ファイル名はスクリプト実行時に指定する Zabbix のグラフ id で名前がつけられる
    - 例) グラフ id が 1111 の場合 → 1111.png

## 事前準備
- conf.ini.org を conf.ini にリネームする
- conf.ini の内容を実環境にあわせて修正する

### conf.ini のパラメータ

|パラメータ|内容|
|----------|----------|
|ZBX_USERNAME|Zabbixへのログインユーザー名|
|ZBX_PASSWORD|Zabbixへのログインパスワード|
|ZBX_SERVER_URL|Zabbixサーバーの管理WebにアクセスするURL(設定によっては http://IP/zabbix とかあるかも)|
|ZBX_SERVER_API_URL|ZabbixのAPIアクセス用URL(基本は変更なし)|
|GRAPH_SAVE_FOLDER_PATH|Zabbixから取得したグラフ画像を保存するフォルダのフルパス|
|GRAPH_WIDTH|グラフ画像の幅サイズ(たぶんピクセル)|
|GRAPH_PERIOD|グラフの表示期間を秒で指定(3600=1時間)|


## 使用方法
コマンドの実行は以下の感じで

```
sh getGraphImage.sh <設定ファイルへのパス> <取得する Zabbix グラフの id>
```

### 注意事項
cron で動作させる時には getGraphImage.sh へのパスを含めパスはすべて絶対パスにしてください。

## 動作確認環境
### 本スクリプトの動作確認済環境
- CentOS Linux release 7.5.1804 (Core)
### グラフ画像が取得できた Zabbix の確認済バージョン
- Zabbix 4.0.43
- Zabbix 5.0.25
