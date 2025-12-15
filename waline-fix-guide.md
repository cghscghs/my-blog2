# 修复 Waline "Failed to fetch" 错误

## 问题分析

你当前的 Vercel 域名：`https://jianxin-blog2-r49jtn916-cghscghs-projects.vercel.app`

这个域名格式看起来是 Vercel 的预览部署域名，不是正式的生产环境域名，可能导致访问问题。

---

## 解决方案 1：使用正确的 Vercel 域名

### 步骤 1：检查你的 Vercel 项目

1. 登录 Vercel：https://vercel.com/
2. 找到你的 Waline 项目
3. 点击项目，查看 "Domains" 部分
4. 应该有一个主域名，格式类似：
   - `your-project-name.vercel.app`
   - 或 `your-project-name-username.vercel.app`

### 步骤 2：使用正确的域名

找到正确的生产环境域名后，替换博客配置中的 `serverURL`

---

## 解决方案 2：重新部署 Waline（推荐）

使用官方一键部署方式，确保配置正确：

### 1. 点击一键部署链接

访问：https://vercel.com/new/clone?repository-url=https://github.com/walinejs/waline/tree/main/example

### 2. 配置项目

- **Repository Name**: 填写项目名，如 `my-waline-comments`
- 点击 **Create** 创建

### 3. 等待部署完成

部署成功后会得到域名，如：`my-waline-comments.vercel.app`

### 4. 配置环境变量

进入项目 → Settings → Environment Variables

添加以下变量（使用 LeanCloud）：

```
LEAN_ID = 你的LeanCloud AppID
LEAN_KEY = 你的LeanCloud AppKey
LEAN_MASTER_KEY = 你的LeanCloud MasterKey
```

#### 获取 LeanCloud 配置：

1. 访问：https://console.leancloud.app/
2. 注册/登录（选择国际版）
3. 创建应用（开发版免费）
4. 进入应用 → Settings → App keys
5. 复制 AppID、AppKey、MasterKey

### 5. 重新部署

添加环境变量后：
1. 进入 Deployments 页面
2. 点击最新部署右侧的三个点
3. 选择 "Redeploy"
4. 等待完成

### 6. 获取正确的域名

部署成功后，复制域名（如 `my-waline-comments.vercel.app`）

---

## 解决方案 3：临时使用测试服务器

如果暂时无法部署，可以先用官方测试服务器看看评论框是否正常显示：

```yaml
waline:
    enable: true
    serverURL: https://waline-comment.vuejs.press
```

这样可以先确认评论框功能正常，然后再部署自己的服务器。

---

## 更新博客配置

获得正确的域名后，编辑以下两个文件：

### 1. themes/particlex/_config.yml

```yaml
waline:
    enable: true
    serverURL: https://你的正确域名.vercel.app
```

### 2. _config.yml（根目录）

找到 waline 配置部分，确保：

```yaml
waline:
    enable: true
    serverURL: https://你的正确域名.vercel.app
```

---

## 重新生成博客

```bash
cd "c:/Users/liuxi/Desktop/博客"
hexo clean && hexo generate
```

刷新浏览器，评论应该就能正常工作了！

---

## 检查清单

如果还是不行，请检查：

1. ✅ Vercel 项目部署成功（状态为 Ready）
2. ✅ 环境变量配置正确
3. ✅ 域名可以在浏览器中直接访问（应该显示 Waline 欢迎页面）
4. ✅ 博客配置文件中 serverURL 正确
5. ✅ 已执行 hexo clean && hexo generate
6. ✅ 浏览器已刷新（清除缓存）

---

## 快速测试

访问你的 Vercel 域名（如 `https://xxx.vercel.app`），应该能看到：

```
Waline
A simple comment system with backend support
```

如果看不到这个页面，说明 Vercel 部署有问题，需要重新部署。

---

## 需要帮助？

如果你：
1. 不确定 Vercel 项目的正确域名
2. LeanCloud 配置不清楚
3. 还是报 Failed to fetch 错误

告诉我当前卡在哪一步，我会详细指导你！
