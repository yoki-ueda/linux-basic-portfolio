#!/bin/bash

# Linux Webサーバーの基本的な稼働状態を確認するヘルスチェックスクリプト
# Apache、HTTP待受ポート、ディスク、メモリ、HTTP応答をまとめて確認する
# cronから定期実行し、結果をログへ記録することを想定

echo "===== Server Health Check ====="
date

# Apacheサービスの稼働状態を確認
echo "--- Apache ---"
systemctl is-active httpd

# HTTPの80番ポートが待受状態になっているか確認
echo "--- Port 80 ---"
/usr/sbin/ss -tln | grep :80

# ルート領域のディスク使用量を確認
echo "--- Disk ---"
df -h /

# メモリ使用状況を確認
echo "--- Memory ---"
free -h

# localhostへHTTPアクセスし、HTTPステータスコードを確認
echo "--- HTTP ---"
curl -s -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost
