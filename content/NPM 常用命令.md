---
title: 📦 NPM 常用命令与缓存清理
tags: [NPM, Node, 包管理, 前端]
---

Node.js 环境下 NPM 包管理器的日常高频操作。

## 缓存清理

当遇到 npm 依赖安装异常或缓存损坏时，强制清理缓存：

```bash
npm cache clean -f
```

## 相关拓展
- 包版本升级推荐使用 `npm-check-updates`（ncu）。
- 源管理推荐使用 `cgr` 或 `nrm` 自由切换镜像源。

---

## 关联网节点
- 查看完整 [[前端开发工具与 Utils]] 工作流。
- 结合 [[Git 常用命令]] 进行依赖管理与版本控制。
