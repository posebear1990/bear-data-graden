---
title: Git 常用命令指南
tags: [Git, 工具, 版本控制, 前端]
---

开发过程中高频使用的 Git 命令行操作集合。

## 常用操作

### 1. 删除远程分支
```bash
git push --delete origin <branch-name>
```

### 2. 撤销 Commit
> [!WARNING]
> 最新 commit 的内容会被抛弃，使用需要谨慎。
```bash
git reset --hard <commit-id> 
```

### 3. 打标签并推送远端
创建标签并同步提交至远程仓库。

### 4. 设置 SOCKS5 代理提升 Clone 速度
在网络受限时为 Git 配置代理：
```bash
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'
```

---

## 关联网节点
- 结合 [[Linux 常用命令]] 与终端命令行技巧。
- 配合 [[前端开发工具与 Utils]] 构建高效开发工作流。
- 遵循 [[编程随想与工程心法]] 中的代码版本管理原则。
