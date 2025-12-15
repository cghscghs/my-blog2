# Vercel 免费部署教程（最推荐⭐⭐⭐）

Vercel 是目前最好用的免费托管平台，速度快，国内访问也不错！

## 优势
- ✅ 全球 CDN 加速，访问速度快
- ✅ 自动部署，每次提交代码自动更新
- ✅ 免费 HTTPS 证书
- ✅ 提供免费域名 `.vercel.app`
- ✅ 可以绑定自定义域名

---

## 部署步骤

### 第一步：注册 Vercel 账号

1. 访问 https://vercel.com
2. 点击 "Sign Up" 注册
3. **推荐用 GitHub 账号登录**（最方便）

### 第二步：把博客代码上传到 GitHub

1. 在 GitHub 创建一个新仓库（名字随意，如 `my-blog`）
2. 在博客目录打开命令行，执行：

```bash
# 初始化 Git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit"

# 关联远程仓库（替换成你的仓库地址）
git remote add origin https://github.com/你的用户名/my-blog.git

# 推送到 GitHub
git push -u origin main
```

### 第三步：在 Vercel 导入项目

1. 登录 Vercel 后，点击 "Add New..." → "Project"
2. 选择 "Import Git Repository"
3. 找到你刚才上传的仓库，点击 "Import"
4. **重要配置：**
   - Framework Preset: 选择 "Hexo"
   - Build Command: `hexo generate`
   - Output Directory: `public`
5. 点击 "Deploy"

### 第四步：等待部署完成

- 大约 1-2 分钟后部署完成
- Vercel 会自动分配一个域名，如：`你的项目名.vercel.app`
- 点击域名就能访问你的博客了！

---

## 后续更新博客

每次写完新文章后：

```bash
# 提交到 GitHub
git add .
git commit -m "新文章"
git push

# Vercel 会自动检测并重新部署！
```

或者使用我创建的快捷脚本：`更新并部署.bat`

---

## 绑定自定义域名

1. 在 Vercel 项目页面，点击 "Settings" → "Domains"
2. 输入你的域名，如 `www.yourdomain.com`
3. 按照提示在域名服务商那里添加 DNS 解析
4. 等待几分钟验证通过即可

Vercel 会自动配置 HTTPS 证书！

---

## 常见问题

### 1. 部署失败？

检查 `package.json` 是否包含 hexo 依赖，如果没有，在博客目录执行：
```bash
npm init -y
npm install hexo --save
```

### 2. 样式丢失？

在 `_config.yml` 中设置正确的 URL：
```yaml
url: https://你的项目名.vercel.app
root: /
```

### 3. 图片不显示？

确保图片路径正确，使用相对路径或绝对路径。
