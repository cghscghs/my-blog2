# 5分钟部署到 Vercel（无需实名认证）

## 第一步：安装 Vercel CLI（可选）

打开命令行，执行：
```bash
npm install -g vercel
```

## 第二步：登录 Vercel

在博客目录执行：
```bash
vercel login
```

会打开浏览器，选择用邮箱或 GitHub 登录（推荐 GitHub）。

## 第三步：部署

在博客目录执行：
```bash
# 生成静态文件
hexo generate

# 进入 public 目录
cd public

# 部署
vercel
```

按照提示操作：
- Set up and deploy? → Yes
- Which scope? → 选择你的账号
- Link to existing project? → No
- Project name? → jianxin-blog（或任意名字）
- In which directory? → ./ （直接回车）

等待几秒，部署完成！会显示你的博客地址。

## 更简单的方式：通过 GitHub 自动部署

1. 把代码上传到 GitHub
2. 访问 https://vercel.com
3. 用 GitHub 登录
4. 点击 "Import Project"
5. 选择你的仓库
6. Framework 选择 "Hexo"
7. 点击 Deploy

以后每次 push 到 GitHub，Vercel 自动更新！
