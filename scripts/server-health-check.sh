#!/bin/bash

echo "===== Server Health Check ====="
date

echo "--- Apache ---"
systemctl is-active httpd

echo "--- Port 80 ---"
/usr/sbin/ss -tln | grep :80

echo "--- Disk ---"
df -h /

echo "--- Memory ---"
free -h

echo "--- HTTP ---"
curl -s -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost
