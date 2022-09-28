# Zabbix のグラフを画像ファイルとして取得する

## 本スクリプトの動作
- 指定した Zabbix のグラフを画像として取得する
- ファイル名はスクリプト実行時に指定する Zabbix のグラフ id で名前がつけられる
    - 例) グラフ id が 1111 の場合 → 1111.png

## 事前準備
- conf.ini.org を conf.ini にリネームする
- conf.ini の内容を実環境にあわせて修正する

## 使用方法
コマンドの実行は以下の感じで

```
sh getGraphImage.sh <設定ファイルへのパス> <取得する Zabbix グラフの id>
```

### 注意事項
cron で動作させる時には getGraphImage.sh へのパスを含めパスはすべて絶対パスにしてください。

## 動作確認OS
- CentOS Linux release 7.5.1804 (Core)
