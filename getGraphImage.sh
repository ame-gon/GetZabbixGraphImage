#!/bin/sh

#
# スクリプトの実行方法
# sh getGraphImage.sh <設定ファイルへのパス> <取得する Zabbix グラフの id>
# ※ cron で動作させる時には getGraphImage.sh へのパスを含めパスはすべて絶対パスにしてください。
#

# 外部設定ファイルの読み込み
source $1

# 取得するグラフid
target_graphid=$2

#
# Token 取得用 PARAMS
#
PARAMS_1=$(cat << EOS
  {"auth":null,"method":"user.login","id":1,"params":{"user":"${ZBX_USERNAME}","password":"${ZBX_PASSWORD}"},
"jsonrpc":"2.0"}
EOS
)

#
# TOKEN 取得部
# 本番Zabbixからの情報を得るために、Netサーバー上の Zabbix 管理 Web にアクセス
#
TOKEN=$(
  curl -s -H 'Content-Type:application/json-rpc' \
  -d "${PARAMS_1}" ${ZBX_SERVER_API_URL} | jq -r '.result'
)

#
# 戻り値エラーチェック
# 値が null ではないこと
# → null だったら終了。
#
if [ "${TOKEN}" = null ]; then
  # 認証できず。処理中断。
  return 2> /dev/null
  echo "グラフを取得することができませんでした。"
  exit
fi

curl -X GET -b zbx_sessionid="${TOKEN}" "${ZBX_SERVER_URL}/chart2.php?graphid=${target_graphid}&width=${GRAPH_WIDTH}&period=${GRAPH_PERIOD}" > ${GRAPH_SAVE_FOLDER_PATH}/${target_graphid}.png
