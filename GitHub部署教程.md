# GitHub Pages 免费部署教程

## 第一步：创建 GitHub 账号（如果还没有）

1. 访问 https://github.com
2. 点击 Sign up 注册
3. 填写邮箱、密码、用户名

## 第二步：创建仓库

1. 登录 GitHub 后，点击右上角 "+" → "New repository"
2. **仓库名必须是：** `你的用户名.github.io`
   - 例如：如果你的用户名是 `zhangsan`，仓库名就是 `zhangsan.github.io`
3. 选择 Public（公开）
4. 点击 "Create repository"

## 第三步：获取仓库地址

创建完成后，复制仓库的 HTTPS 地址，格式类似：
```
https://github.com/你的用户名/你的用户名.github.io.git
```

## 第四步：配置 _config.yml

打开博客目录下的 `_config.yml` 文件，找到最底部的 `deploy:` 部分，修改为：

```yaml
# Deployment
deploy:
  type: git
  repo: https://github.com/你的用户名/你的用户名.github.io.git
  branch: main
```

**注意：** 把 `你的用户名` 替换成你的 GitHub 用户名！

## 第五步：部署到 GitHub

在博客目录打开命令行，依次执行：

```bash
# 清理缓存
hexo clean

# 生成静态文件
hexo generate

# 部署到 GitHub
hexo deploy
```

第一次部署时会要求输入 GitHub 用户名和密码（或 Token）。

## 第六步：访问你的博客

部署成功后，访问：
```
https://你的用户名.github.io
```

就能看到你的博客了！🎉

## 一键部署脚本

以后每次更新博客，只需要双击 `部署到GitHub.bat` 即可！

---

## 绑定自定义域名（可选）

如果你有自己的域名（如 `www.yourdomain.com`）：

1. 在仓库根目录创建 `CNAME` 文件，内容写你的域名
2. 在域名服务商那里添加 DNS 解析：
   - 类型：CNAME
   - 主机记录：www
   - 记录值：你的用户名.github.io

等待几分钟后，就可以用自己的域名访问了！

---

## 常见问题

### 1. 提示需要 Token？

GitHub 现在要求使用 Personal Access Token：

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 生成后复制 Token
5. 部署时用 Token 替代密码

### 2. 访问速度慢？

GitHub Pages 在国内访问较慢，可以考虑：
- 使用 Vercel 部署（速度更快）
- 或使用 CDN 加速

### 3. 每次都要输入密码？

可以配置 Git 凭据保存：
```bash
git config --global credential.helper store
```
