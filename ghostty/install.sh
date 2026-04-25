#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config/ghostty"
TARGET="$TARGET_DIR/config"
LEGACY="$HOME/Library/Application Support/com.mitchellh.ghostty/config"

mkdir -p "$TARGET_DIR"

# 备份既有配置（首次部署且内容不一致时）
if [[ -f "$TARGET" ]] && ! cmp -s "$SCRIPT_DIR/config" "$TARGET"; then
  cp "$TARGET" "$TARGET_DIR/config.predotfiles.bak"
  echo "已备份原配置到 $TARGET_DIR/config.predotfiles.bak"
fi

cp "$SCRIPT_DIR/config" "$TARGET"
echo "Ghostty 配置已复制到 $TARGET"

# 清理 ghostty 自动生成的 .bak（保留本脚本的 predotfiles.bak）
shopt -s nullglob
for bak in "$TARGET_DIR"/config.*.bak; do
  [[ "$bak" == "$TARGET_DIR/config.predotfiles.bak" ]] && continue
  rm -f "$bak" && echo "已清理冗余备份: $bak"
done
shopt -u nullglob

# 清理 macOS Application Support 下仅含注释的模板
if [[ -f "$LEGACY" ]]; then
  if ! grep -qE '^[[:space:]]*[^#[:space:]]' "$LEGACY"; then
    rm -f "$LEGACY"
    echo "已清理空模板: $LEGACY"
  else
    echo "警告: $LEGACY 含实际配置，未自动删除，请手动迁移" >&2
  fi
fi

echo "完成。重启 Ghostty 或按 Cmd+Shift+, 重载配置。"
