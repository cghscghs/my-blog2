# Waline 评论系统快速开始指南

## 🚀 最快捷的部署方式（推荐）

### 方式 1：一键部署到 Vercel（5分钟完成）

#### 第一步：点击一键部署按钮

1. 访问这个链接：https://vercel.com/new/clone?repository-url=https://github.com/walinejs/waline/tree/main/example

2. 如果没有 Vercel 账号：
   - 点击 "Sign Up"
   - 使用 GitHub 账号登录（最简单）
   - 或使用邮箱注册

3. 在 Vercel 页面：
   - 项目名称：随意填写，如 `my-blog-comments`
   - 点击 "Create" 按钮

#### 第二步：配置环境变量

部署完成后，进入项目设置：

1. 点击 "Settings" → "Environment Variables"

2. 添加数据库配置（使用 LeanCloud 国际版）：

   **快速获取 LeanCloud 数据库：**
   - 访问：https://console.leancloud.app/
   - 注册并创建应用
   - 进入应用 → Settings → App keys
   - 复制以下信息：

   在 Vercel 中添加环境变量：
   ```
   LEAN_ID = 你的 AppID
   LEAN_KEY = 你的 AppKey  
   LEAN_MASTER_KEY = 你的 MasterKey
   ```

3. **配置 QQ 登录（可选）：**

   访问：https://connect.qq.com/
   - 注册 QQ 互联开发者
   - 创建网站应用
   - 网站回调域填写你的 Vercel 域名
   
   添加环境变量：
   ```
   QQ_ID = 你的 QQ AppID
   QQ_KEY = 你的 QQ AppKey
   ```

4. **配置微信登录（可选）：**

   访问：https://open.weixin.qq.com/
   - 注册微信开放平台
   - 创建网站应用（需要300元认证费）
   - 回调域填写你的 Vercel 域名
   
   添加环境变量：
   ```
   WECHAT_ID = 你的微信 AppID
   WECHAT_KEY = 你的微信 AppSecret
   ```

#### 第三步：重新部署

1. 点击 "Deployments" 
2. 点击最新的部署右侧的三个点
3. 选择 "Redeploy"
4. 等待部署完成

#### 第四步：获取服务器地址

部署成功后，你会得到一个地址，例如：
```
https://my-blog-comments.vercel.app
```

这就是你的 `serverURL`！

#### 第五步：配置博客

编辑文件：`themes/particlex/_config.yml`

找到 Waline 配置部分，填入你的 serverURL：

```yaml
waline:
    enable: true
    serverURL: https://my-blog-comments.vercel.app  # 填入你的地址
```

#### 第六步：生成并查看

```bash
cd "c:/Users/liuxi/Desktop/博客"
hexo clean && hexo generate
hexo server
```

访问任意文章页面，应该能看到评论框了！

---

## 📝 管理评论

访问：`https://你的域名.vercel.app/ui`

首次访问会要求注册管理员账号，之后可以：
- 管理评论
- 审核评论
- 查看统计
- 管理用户

---

## 🎯 简化版：不使用社交登录

如果暂时不需要 QQ/微信登录，可以：

1. 只配置数据库（LEAN_ID、LEAN_KEY、LEAN_MASTER_KEY）
2. 用户可以匿名评论（填写昵称即可）
3. 或使用邮箱登录（内置功能）

这样部署更简单，3分钟就能完成！

---

## ⚡ 更简单的方案：使用 Twikoo

如果觉得 Waline 还是复杂，可以用 Twikoo：

### Twikoo 快速部署（腾讯云开发）

1. **注册腾讯云**：https://cloud.tencent.com/

2. **开通云开发**：
   - 进入云开发控制台
   - 创建环境（按量计费，免费额度够用）
   - 记录环境 ID

3. **部署 Twikoo**：
   - 进入云函数
   - 新建云函数
   - 名称：twikoo
   - 运行环境：Node.js 16.13
   - 函数代码选择：使用示例代码 → Twikoo
   - 部署

4. **配置博客**：
   编辑 `themes/particlex/_config.yml`：
   ```yaml
   waline:
       enable: false  # 关闭 Waline
   
   twikoo:
       enable: true
       envID: 你的环境ID
       region: ap-shanghai  # 或你选择的地域
       lang: zh-CN
   ```

Twikoo 也支持 QQ 登录，配置更简单！

---

## 🆘 遇到问题？

常见问题：

1. **评论框不显示**
   - 检查 serverURL 是否正确
   - 检查浏览器控制台是否有错误
   - 确认文章 Front Matter 中有 `comments: true`

2. **无法登录**
   - 确认环境变量配置正确
   - 检查回调域名是否正确
   - QQ/微信应用需要审核通过

3. **评论不显示**
   - 访问管理后台查看评论是否需要审核
   - 检查数据库连接是否正常

---

## 📞 需要帮助

如果你在部署过程中遇到任何问题，告诉我具体卡在哪一步，我会详细指导你！

现在就去试试吧！🎉
