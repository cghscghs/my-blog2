# Vercel 网页端部署教程（最简单，无需命令行）

## 🎯 为什么选择 Vercel？

- ✅ **完全免费**，无任何隐藏费用
- ✅ **无需实名认证**，无需身份证
- ✅ **国内访问速度快**
- ✅ **自动部署**，推送代码自动更新
- ✅ **免费 HTTPS**
- ✅ **可绑定自定义域名**

---

## 📋 部署步骤（5分钟搞定）

### 第一步：先把代码上传到 GitHub

#### 1.1 创建 GitHub 账号
- 访问 https://github.com
- 点击 Sign up 注册（只需邮箱，无需实名）

#### 1.2 创建仓库
1. 登录后，点击右上角 "+" → "New repository"
2. 仓库名：`jianxin-blog`（或任意名字）
3. 选择 Public（公开）
4. 点击 "Create repository"

#### 1.3 上传代码到 GitHub
在博客目录打开命令行，执行：

```bash
# 配置 Git
git config --global user.name "JianXin"
git config --global user.email "2453280367@qq.com"

# 初始化
git init

# 添加所有文件
git add .

# 提交
git commit -m "博客初始化"

# 关联远程仓库（替换成你的仓库地址）
git remote add origin https://github.com/你的用户名/jianxin-blog.git

# 推送
git branch -M main
git push -u origin main
```

### 第二步：在 Vercel 导入项目

#### 2.1 注册/登录 Vercel
1. 访问 https://vercel.com
2. 点击 "Sign Up"
3. **选择 "Continue with GitHub"**（用 GitHub 登录最方便）

#### 2.2 导入 GitHub 仓库
1. 登录后，点击 "Add New..." → "Project"
2. 点击 "Import Git Repository"
3. 如果是第一次，需要授权 Vercel 访问 GitHub
4. 找到 `jianxin-blog` 仓库，点击 "Import"

#### 2.3 配置项目
1. **Framework Preset**: 选择 "Other"（或 Hexo，如果有的话）
2. **Build Command**: 输入 `hexo generate`
3. **Output Directory**: 输入 `public`
4. **Install Command**: 保持默认 `npm install`

#### 2.4 部署
点击 "Deploy" 按钮，等待 1-2 分钟...

### 第三步：访问你的博客

部署完成后，Vercel 会显示：
- 🎉 **你的博客地址**：`https://jianxin-blog.vercel.app`
- 或其他随机域名

点击访问即可看到你的博客！

---

## 🔄 以后如何更新博客？

### 方法一：使用 Git 命令

写完新文章后，在博客目录执行：

```bash
git add .
git commit -m "新文章"
git push
```

**Vercel 会自动检测并重新部署！** 1-2分钟后访问博客就能看到更新。

### 方法二：使用快捷脚本

双击我创建的 `更新到Vercel.bat` 脚本即可！

---

## 🌐 绑定自定义域名（可选）

如果你有自己的域名（如 `www.jianxin.com`）：

1. 在 Vercel 项目页面，点击 "Settings" → "Domains"
2. 输入你的域名
3. 按照提示在域名服务商添加 DNS 解析：
   - 类型：CNAME
   - 主机记录：www
   - 记录值：cname.vercel-dns.com
4. 等待几分钟验证通过

Vercel 会自动配置 HTTPS 证书！

---

## ❓ 常见问题

### 1. 部署失败怎么办？

检查是否缺少 `package.json`，在博客目录执行：
```bash
npm init -y
npm install hexo --save
```

重新推送到 GitHub：
```bash
git add .
git commit -m "添加 package.json"
git push
```

Vercel 会自动重新部署。

### 2. 样式丢失？

修改 `_config.yml`：
```yaml
url: https://你的项目名.vercel.app
root: /
```

### 3. 图片不显示？

确保图片使用相对路径，并且已经上传到 GitHub。

### 4. 访问速度慢？

Vercel 在国内访问已经很快了，如果还想更快：
- 考虑使用 CDN
- 或使用 Cloudflare Pages

---

## 🎊 总结

Vercel 是目前最推荐的免费部署方案：
- ✅ 完全免费
- ✅ 无需实名
- ✅ 自动部署
- ✅ 速度快

比 Gitee Pages 更方便（不用手动更新），比腾讯云便宜（完全免费）！
