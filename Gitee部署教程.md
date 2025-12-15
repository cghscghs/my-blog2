# Gitee Pages 免费部署教程（国内访问快⭐⭐⭐）

Gitee（码云）是国内版的 GitHub，部署到 Gitee Pages 国内访问速度非常快！

## 优势
- ✅ 国内访问速度快
- ✅ 完全免费
- ✅ 不需要科学上网
- ✅ 支持中文界面

## 缺点
- ❌ 需要实名认证
- ❌ 免费版需要手动更新部署
- ❌ 不支持自定义域名（免费版）

---

## 部署步骤

### 第一步：注册 Gitee 账号

1. 访问 https://gitee.com
2. 点击右上角"注册"
3. 填写手机号、邮箱、密码
4. **完成实名认证**（需要上传身份证照片）

### 第二步：创建仓库

1. 登录后，点击右上角 "+" → "新建仓库"
2. **仓库名建议：** `你的用户名` （如：zhangsan）
   - 这样访问地址更简洁：`https://你的用户名.gitee.io`
3. 选择"公开"
4. 勾选"使用 Readme 文件初始化这个仓库"
5. 点击"创建"

### 第三步：开启 Gitee Pages 服务

1. 进入仓库页面
2. 点击"服务" → "Gitee Pages"
3. 选择部署分支：`master`
4. 点击"启动"
5. 等待几秒，会生成访问地址：`https://你的用户名.gitee.io/仓库名`

### 第四步：配置部署

在博客目录下，修改 `_config.yml` 文件：

```yaml
# Deployment
deploy:
  type: git
  repo: https://gitee.com/你的Gitee用户名/仓库名.git
  branch: master
```

**注意：**
- Gitee 默认分支是 `master`，不是 `main`
- 把上面的"你的Gitee用户名"和"仓库名"替换成实际的

### 第五步：首次部署

在博客目录打开命令行：

```bash
# 清理
hexo clean

# 生成
hexo generate

# 部署
hexo deploy
```

第一次会要求输入 Gitee 用户名和密码。

### 第六步：更新 Gitee Pages

**重要：** 每次部署后，需要手动更新 Gitee Pages！

1. 访问仓库页面
2. 点击"服务" → "Gitee Pages"
3. 点击"更新"按钮
4. 等待几秒后刷新博客地址即可看到更新

---

## 一键部署脚本

我已经为你创建了 `部署到Gitee.bat` 脚本，但是：
- ⚠️ 部署完成后，**必须手动去 Gitee 网站点击"更新"按钮**
- 这是 Gitee 免费版的限制

---

## 自动化更新（可选，需要付费）

如果不想每次手动点更新：

### 方案 1：Gitee Pages Pro（付费）
- 价格：99元/年
- 可以自动更新
- 支持自定义域名

### 方案 2：使用 Gitee Actions（免费但复杂）
需要配置 CI/CD 自动化流程，比较复杂。

---

## 对比建议

| 平台 | 访问速度 | 自动部署 | 费用 | 推荐度 |
|------|---------|---------|------|--------|
| **Gitee Pages** | ⭐⭐⭐⭐⭐ 超快 | ❌ 需手动 | 免费 | ⭐⭐⭐ |
| **GitHub Pages** | ⭐⭐ 较慢 | ✅ 自动 | 免费 | ⭐⭐⭐ |
| **Vercel** | ⭐⭐⭐⭐ 快 | ✅ 自动 | 免费 | ⭐⭐⭐⭐⭐ |

### 我的建议：

1. **最省心：Vercel** 
   - 速度快，自动部署，完全免费
   - 国内访问也不错

2. **访问最快：Gitee** 
   - 国内访问最快
   - 但每次要手动更新，略麻烦

3. **双线部署**（推荐⭐⭐⭐）
   - 同时部署到 Gitee + Vercel
   - 国内用户访问 Gitee，国外用户访问 Vercel
   - 两全其美！

---

## 双线部署配置

修改 `_config.yml`：

```yaml
# Deployment
deploy:
  - type: git
    repo: https://gitee.com/你的用户名/仓库名.git
    branch: master
  - type: git
    repo: https://github.com/你的用户名/你的用户名.github.io.git
    branch: main
```

这样一个命令就能同时部署到两个平台！

---

## 常见问题

### 1. 提示"请完成实名认证"？
必须上传身份证完成实名认证才能使用 Gitee Pages。

### 2. 部署后看不到更新？
记得去 Gitee 网站手动点击"更新"按钮！

### 3. 图片不显示？
检查 `_config.yml` 中的 url 配置：
```yaml
url: https://你的用户名.gitee.io/仓库名
root: /仓库名/
```

### 4. 想要更简洁的地址？
创建仓库时，仓库名和用户名设置成一样的，地址就是：
`https://你的用户名.gitee.io`
