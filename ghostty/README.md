# ghostty

Ghostty 终端配置。

## 部署

```bash
bash install.sh
```

将 `config` 复制到 `~/.config/ghostty/`，并清理：
- `~/.config/ghostty/config.*.bak`（ghostty 自动生成的旧备份）
- `~/Library/Application Support/com.mitchellh.ghostty/config`（仅当为 ghostty 模板/空注释时；macOS 下两处会同时生效，避免双源冲突）

首次部署若本机已有不同配置，会备份为 `config.predotfiles.bak`，确认无误后可手动删除。

## 配置项要点

| 分组 | 关键设置 | 说明 |
|---|---|---|
| 字体 | `font-family = Monaco` / `font-size = 15` / `adjust-cell-height = 10%` | 经典等宽字体 + 略增行距 |
| 主题 | `theme = Catppuccin Mocha` | 深色主题 |
| 窗口 | `window-width = 120` / `window-height = 36` / `window-save-state = always` | 适配 100/120 字符行宽，重启恢复会话 |
| 内边距 | `window-padding-x/y = 8/4` + `padding-balance` | 文本不贴边、缩放时四边均衡 |
| macOS | `macos-titlebar-style = tabs` / `macos-option-as-alt = true` | 标签合并到标题栏；Option→Alt 支持 zsh/vim 词跳转 |
| 渲染 | `scrollback-limit = 100000` / `cursor-style = block` (闪烁) | 10 万行回滚、块状闪烁光标 |
| 交互 | `copy-on-select = clipboard` / `confirm-close-surface = false` / `clipboard-paste-protection = true` | 选中即复制；关分屏不弹窗；粘贴含控制字符仍确认 |
| 工作目录 | `window-inherit-working-directory = true` | 新标签/分屏继承当前目录 |
| 键位 | `shift+enter` → `ESC + CR` | 适配 Claude Code 等的多行输入 |

## 重载

修改后按 `Cmd+Shift+,` 重载，或重启 Ghostty。部分项（窗口尺寸、字体）需新窗口才生效。
