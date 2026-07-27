# 🌱 Bear Data Garden (LLM-Wiki 数字花园)

> 一个遵循 **Andrej Karpathy LLM-Wiki 模式** 构建的复利型数字知识花园 (Compounding Knowledge Network)。

---

## 💡 理论哲学与核心理念

本知识库不同于传统的无状态 RAG 检索，遵循 **LLM-Wiki** 增量编译与持续演进架构：

* **人机分工 (Human-AI Division of Labor)**：
  * 👤 **用户 (User)**：负责提供原始资料来源（网址、剪藏、文本或粗糙想法），专注阅读与思考。
  * 🤖 **LLM Agent**：承担全部繁琐的簿记工作（Bookkeeping）——自动提取概念、撰写 Markdown 知识节点、建立 `[[双向链接]]`、维保 `index.md` 索引并解决知识冲突。
* **双层结构模型**：
  1. **Schema 规约层**：[AGENTS.md](content/LLM-Wiki%20%E6%95%B0%E5%AD%97%E8%8A%B1%E5%9B%AD%E7%BB%B4%E6%8A%A4%E8%A7%84%E7%BA%A6%20(AGENTS.md).md) - 规范 Agent 的 Ingest/Query/Lint 维保操作协议。
  2. **知识网层**：`content/` 目录下纯 Markdown 打造的双向链接知识网络。

---

## ✨ 特色与增强功能

* **Graph View 全常显**：在网络拓扑图中，节点文章标题 100% 永久常显，无需悬停即可一览全貌。
* **多系统快捷键指示**：在 Search 搜索框与 Graph View 标题旁自动适配 macOS (`⌘K`/`⌘G`) 与 Windows/Linux (`Ctrl+K`/`Ctrl+G`) 悬浮徽章。
* **中文与编码修正**：完美修复非 ASCII / 中文路径在本地和 Graph 中的链接解析。
* **完整影音记录**：包含 2006-2026 年完整 20 年个人番剧观影日志与星级评级。

---

## 🛠️ 本地运行与构建

本项目基于 [Quartz 5](https://quartz.jzhao.xyz/) 构建：

```bash
# 1. 安装依赖
npm install

# 2. 启动本地实时预览服务器 (监听 8088 端口)
npm run quartz build -- --serve --port 8088

# 3. 静态构建生产资源 (输出至 public/)
npm run quartz build
```

---

## 📜 维护规约

知识库维保协议详见 [AGENTS.md](content/LLM-Wiki%20%E6%95%B0%E5%AD%97%E8%8A%B1%E5%9B%AD%E7%BB%B4%E6%8A%A4%E8%A7%84%E7%BA%A6%20(AGENTS.md).md)。
