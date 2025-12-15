# Waline 评论系统部署指南

## 方案选择

### 推荐方案：使用 Vercel 部署（免费 + 简单）

Waline 支持 QQ、微信、GitHub、微博等多种社交登录方式。

---

## 步骤 1：准备数据库

### 选项 A：使用 LeanCloud（推荐，免费）

1. 访问 [LeanCloud](https://console.leancloud.cn/) 并注册账号
2. 进入控制台，创建应用（开发版免费）
3. 进入应用 → 设置 → 应用凭证
4. 记录以下信息：
   - `AppID：BmpvR4xkjaSS294k1otJNton-gzGzoHsz`
   - `AppKey：h5jHU9JAuiFTt2mubYk7bmIw`
   - `MasterKey：JhFVgVvyfHWqGXGRqmoPMWJw`
   - `REST API 服务器地址：https://bmpvr4xk.lc-cn-n1-shared.com`

### 选项 B：使用其他数据库
- MySQL
- PostgreSQL
- MongoDB
- 等等

---

## 步骤 2：部署 Waline 服务端

### 方式 1：Vercel 部署（最简单）

1. **Fork Waline 仓库**
   - 访问：https://github.com/walinejs/waline
   - 点击右上角 "Fork" 按钮

2. **在 Vercel 部署**
   - 访问：https://vercel.com
   - 使用 GitHub 账号登录
   - 点击 "New Project"
   - 选择刚才 Fork 的 waline 仓库
   - 点击 "Import"

3. **配置环境变量**
   在 Vercel 项目设置中添加以下环境变量：

   ```
   LEAN_ID=你的LeanCloud AppID
   LEAN_KEY=你的LeanCloud AppKey
   LEAN_MASTER_KEY=你的LeanCloud MasterKey
   LEAN_SERVER=你的LeanCloud REST API服务器地址
   ```

4. **社交登录配置（可选）**
   
   **QQ 登录：**
   ```
   QQ_ID=你的QQ互联AppID
   QQ_KEY=你的QQ互联AppKey
   ```
   
   获取方式：
   - 访问 [QQ互联](https://connect.qq.com/)
   - 注册开发者账号
   - 创建网站应用
   - 获取 AppID 和 AppKey

   **微信登录：**
   ```
   WECHAT_ID=你的微信开放平台AppID
   WECHAT_KEY=你的微信开放平台AppSecret
   ```
   
   获取方式：
   - 访问 [微信开放平台](https://open.weixin.qq.com/)
   - 注册开发者账号
   - 创建网站应用
   - 获取 AppID 和 AppSecret

5. **部署完成**
   - Vercel 会自动部署
   - 部署成功后会得到一个访问地址，如：`https://your-project.vercel.app`
   - 这个地址就是你的 `serverURL`

---

## 步骤 3：配置博客

编辑 `themes/particlex/_config.yml`，找到 Waline 配置部分：

```yaml
# Waline
waline:
    enable: true  # 改为 true
    serverURL: https://your-project.vercel.app  # 你的 Vercel 部署地址
    locale:
        placeholder: '请留下你的评论...'
    commentCount: true
    pageview: true
    emoji:
        - https://unpkg.com/@waline/emojis@1.2.0/weibo
        - https://unpkg.com/@waline/emojis@1.2.0/bilibili
        - https://unpkg.com/@waline/emojis@1.2.0/qq
        - https://unpkg.com/@waline/emojis@1.2.0/tieba
    meta:
        - nick
        - mail
    requiredMeta:
        - nick
    lang: zh-CN
    wordLimit: 0
    login: enable  # enable=可选登录, force=强制登录, disable=禁用登录
    pageSize: 10
```

---

## 步骤 4：启用文章评论

在文章的 Front Matter 中添加：

```yaml
---
title: 文章标题
date: 2025-12-15
comments: true  # 启用评论
---
```

或者在主题配置中设置默认启用。

---

## 步骤 5：管理后台

1. 访问：`https://your-project.vercel.app/ui`
2. 首次访问会要求注册管理员账号
3. 注册后即可管理评论、用户等

---

## 简化方案：使用 Twikoo（更简单）

如果觉得 Waline 配置复杂，可以使用 Twikoo（也支持社交登录）：

### Twikoo 快速部署

1. **使用腾讯云开发（免费）**
   - 访问：https://cloud.tencent.com/product/tcb
   - 创建环境
   - 安装 Twikoo 云函数

2. **配置博客**
   ```yaml
   twikoo:
       enable: true
       envID: 你的环境ID
       region: ap-shanghai  # 环境地域
       lang: zh-CN
   ```

详细教程：https://twikoo.js.org/quick-start.html

---

## 注意事项

1. **域名回调配置**
   - QQ/微信登录需要配置回调域名
   - 回调地址格式：`https://your-domain.com`
   - 在 QQ 互联/微信开放平台中配置

2. **HTTPS 要求**
   - QQ/微信登录必须使用 HTTPS
   - Vercel 自动提供 HTTPS

3. **备案要求**（仅针对国内服务）
   - 如果使用自己的域名，可能需要备案
   - 使用 Vercel 域名无需备案

---

## 测试评论系统

1. 重新生成博客：`hexo clean && hexo generate`
2. 访问任意文章页面
3. 应该能看到评论框
4. 尝试发表评论
5. 如果配置了社交登录，会看到登录按钮

---

## 需要帮助？

如果你需要我帮你：
1. 配置 Waline
2. 申请 QQ/微信开发者账号
3. 调试评论系统

请告诉我，我会提供详细指导！
