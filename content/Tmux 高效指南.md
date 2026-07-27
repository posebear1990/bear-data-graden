---
title: 🖥️ Tmux 终端复用高效指南
tags: [Tmux, Terminal, Linux, 效率]
---

Tmux 是终端会话保持与分屏复用的必备利器。

## 1. 会话管理 (Session)

```bash
# 创建并命名新会话
tmux new -s session-name

# 查看所有正在运行的会话列表
# 快捷键：Ctrl+b s

# 重新连接到已有会话
tmux a -t session-name

# 暂时断开当前会话（保持后台运行）
# 快捷键：Ctrl+b d

# 彻底彻底杀死/关闭会话
tmux kill-session -t session-name
```

## 2. 窗口管理 (Window)

* `Ctrl+b c`：创建一个新窗口
* `Ctrl+b ,`：重命名当前窗口
* `Ctrl+b w`：交互式选择与切换窗口

## 3. 面板管理 (Panel)

* `Ctrl+d`：关闭当前激活的面板
* `Ctrl+b ?`：快捷键帮助手册

## 4. 推荐插件

* **tmuxinator**：通过 YAML 配置文件自动启动和恢复复杂的 Tmux 会话与多分屏布局。

---

## 关联网节点
- 搭配 [[Linux 常用命令]] 进行高效远程服务器管理。
- 结合 [[Git 常用命令]] 实现命令行开发自动化。
