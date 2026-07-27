---
title: 🧰 前端开发工具与 Utils 集合
tags: [工具, Node, 调试, 前端]
---

积累的前端工程化工具链与实用校验规则。

## 工具链

1. **Node 版本管理**：推荐使用 `nvm` 或 `n`。
2. **镜像源管理**：使用 `cgr` 快速切换 npm/yarn 镜像源。
3. **依赖升级**：使用 `npm-check-updates` (ncu) 批量更新 `package.json` 依赖版本。

## Node.js 在 Chrome 中调试

使用 `--inspect` 标志启动 Node 服务：

```bash
node --inspect app.js
```
在 Chrome 浏览器中打开 `chrome://inspect`，点击 **inspect** 即可打断点与调优。

## 常用校验规则 Utils Gist

- [常用 Validation 规则集合 Gist](https://gist.github.com/posebear1990/3a2d842d0f1b6fa0fed8d02e9c49767e)

---

## 关联网节点
- 搭配 [[NPM 常用命令]] 进行依赖管理。
- 搭配 [[Git 常用命令]] 进行自动化脚本构建。
- 遵循 [[编程随想与工程心法]] 的最佳实践。
