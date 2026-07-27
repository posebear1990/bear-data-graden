#!/bin/bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VPS_HOST="${VPS_HOST:-192.236.222.45}"
VPS_PORT="${VPS_PORT:-2222}"
VPS_USER="${VPS_USER:-root}"
DOMAIN="wiki.xiaoxiong.app"
REMOTE_SITE_DIR="/opt/wiki-xiaoxiong-app/site"
CERT_NAME="xiaoxiong.app"

echo "🔨 Building Quartz production bundle..."
npm run quartz build

STAGE_DIR="$(mktemp -d)"
trap 'rm -rf "${STAGE_DIR}"' EXIT

echo "📦 Preparing deployment artifacts..."
rsync -av --delete "${PROJECT_DIR}/public/" "${STAGE_DIR}/"

echo "🚀 Uploading static site to ${VPS_USER}@${VPS_HOST}:${VPS_PORT} -> ${REMOTE_SITE_DIR}..."
ssh -p "${VPS_PORT}" "${VPS_USER}@${VPS_HOST}" "mkdir -p '${REMOTE_SITE_DIR}'"
rsync -avz -e "ssh -p ${VPS_PORT}" --delete "${STAGE_DIR}/" "${VPS_USER}@${VPS_HOST}:${REMOTE_SITE_DIR}/"

NGINX_CONF="${STAGE_DIR}/${DOMAIN}.conf"
cat > "${NGINX_CONF}" <<CONF
server {
    listen 80;
    server_name ${DOMAIN};

    if (\$host != ${DOMAIN}) {
        return 444;
    }
    return 301 https://${DOMAIN}\$request_uri;
}

server {
    listen 443 ssl;
    server_name ${DOMAIN};

    if (\$host != ${DOMAIN}) {
        return 444;
    }

    ssl_certificate /etc/letsencrypt/live/${CERT_NAME}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${CERT_NAME}/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    root ${REMOTE_SITE_DIR};
    index index.html;

    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/javascript application/javascript application/json image/svg+xml;

    location = / {
        add_header Cache-Control no-store,no-cache,must-revalidate;
        add_header Pragma no-cache;
        add_header Expires 0;
        try_files /index.html =404;
    }

    location = /index.html {
        add_header Cache-Control no-store,no-cache,must-revalidate;
        add_header Pragma no-cache;
        add_header Expires 0;
        try_files /index.html =404;
    }

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    location ~* \.(css|js|svg|png|jpg|jpeg|gif|ico|woff|woff2|ttf)$ {
        expires 7d;
        add_header Cache-Control public;
    }
}
CONF

echo "⚙️ Deploying Nginx configuration /etc/nginx/conf.d/${DOMAIN}.conf..."
scp -P "${VPS_PORT}" "${NGINX_CONF}" "${VPS_USER}@${VPS_HOST}:/etc/nginx/conf.d/${DOMAIN}.conf"

echo "🔄 Testing Nginx and reloading..."
ssh -p "${VPS_PORT}" "${VPS_USER}@${VPS_HOST}" "set -e
nginx -t
systemctl reload nginx"

echo "✅ Success! Site deployed to: https://${DOMAIN}/"
