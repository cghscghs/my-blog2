# GitHub Pages 快速部署（无需实名认证）

## 第一步：创建 GitHub 账号

访问 https://github.com 注册（无需实名认证）

## 第二步：创建仓库

仓库名必须是：`你的GitHub用户名.github.io`

例如：`jianxin.github.io`

## 第三步：配置 _config.yml

修改博客目录下的 `_config.yml`：

```yaml
# URL 配置
url: https://你的用户名.github.io
root: /

# 部署配置
deploy:
  type: git
  repo: https://github.com/你的用户名/你的用户名.github.io.git
  branch: main
```

## 第四步：部署

在博客目录执行：
```bash
hexo clean
hexo generate
hexo deploy
```

第一次需要输入 GitHub 用户名和密码（或 Token）。

## 第五步：访问博客

访问：https://你的用户名.github.io

等待几分钟后生效。

## 获取 GitHub Token（如果需要）

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 生成后复制 Token
5. 部署时用 Token 替代密码
