#!/bin/bash
set -e

echo "==> Flutter SDK (stable channel) をインストール中..."
if [ ! -d "/opt/flutter" ]; then
  sudo git clone https://github.com/flutter/flutter.git -b stable --depth 1 /opt/flutter
  sudo chown -R "$(whoami)" /opt/flutter
fi

if ! grep -q "/opt/flutter/bin" ~/.bashrc; then
  echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc
fi
export PATH="$PATH:/opt/flutter/bin"

echo "==> Flutter Web 向けにキャッシュを取得中..."
flutter config --enable-web
flutter precache --web

echo "==> セットアップ完了。動作確認："
flutter doctor
