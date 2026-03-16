#!/usr/bin/env bash
set -euo pipefail

RIME_DIR="$HOME/Library/Rime"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 检查鼠须管是否已安装
if [[ ! -d "$RIME_DIR" ]]; then
  echo "错误: $RIME_DIR 不存在，请先安装鼠须管 (Squirrel)" >&2
  exit 1
fi

# 检查 rime-ice 是否已安装
if [[ ! -f "$RIME_DIR/rime_ice.schema.yaml" ]]; then
  echo "错误: 未检测到 rime-ice，请先通过 rime-install 安装雾凇拼音" >&2
  exit 1
fi

# 复制自定义配置
cp "$SCRIPT_DIR/default.custom.yaml" "$RIME_DIR/default.custom.yaml"
cp "$SCRIPT_DIR/squirrel.custom.yaml" "$RIME_DIR/squirrel.custom.yaml"

echo "Rime 自定义配置已复制到 $RIME_DIR"
echo "请手动重新部署鼠须管以使配置生效"
