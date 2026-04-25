# rime

[鼠须管 (Squirrel)](https://github.com/rime/squirrel) + [雾凇拼音 (rime-ice)](https://github.com/iDvel/rime-ice) 的自定义补丁。

## 前置依赖

- `brew install --cask squirrel`
- 通过 `~/Library/Rime/rime-install` 安装雾凇拼音（生成 `rime_ice.schema.yaml`）

## 部署

```bash
bash install.sh
```

将三个 `*.custom.yaml` 复制到 `~/Library/Rime/`，**完成后需在鼠须管菜单手动「重新部署」生效**。

## 文件分工

| 文件 | 作用 |
|---|---|
| `default.custom.yaml` | 全局补丁：候选词每页 8 个（默认 5） |
| `rime_ice.custom.yaml` | 雾凇拼音方案补丁：第一个开关 (`ascii_mode`) 默认值 = 1，激活输入法时默认英文，避免输入中文命令/代码时误触 |
| `squirrel.custom.yaml` | 皮肤与按应用行为补丁 |

## squirrel.custom.yaml 关键内容

**配色**：自定义 `mac` / `mac_dark` 两套配色（`hilited_candidate_back_color` 偏橙 `#d85a00`），随系统浅/深色切换。

**候选条样式**：横排布局、`label_font_point: 8`、边框收缩 3px。

**应用级 ASCII 模式**：在以下 App 启动时强制英文输入，避免命令/搜索框被中文打断——
- Apple Terminal、Ghostty、iTerm2
- Alfred、Spotlight
- VSCode

> 注：`ascii_mode` 默认值由 `rime_ice.custom.yaml` 控制（修补的是当前激活的方案 schema，而非 default.yaml；详见 commit `634caf7`）。

## 重载

修改后通过菜单栏鼠须管图标 → 「重新部署」生效。
