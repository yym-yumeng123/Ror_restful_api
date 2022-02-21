### 详解Gemfile

Gemfile 是 bundle 依赖管理工具的依赖配置文件, 其他项目也可以使用它来管理依赖

默认的 Gemfile 文件

```rb
# 表示当前文件的默认地址
source 'https://...'

# 定义git 源, 这里添加的是 github
git_source(:github) { |repo| "https://github.com/#{repo}.com" }

# 指定当前依赖的ruby 版本
ruby '2.6.0'

# rails 版本, 以后可以升级
gem 'rails', '~> 5.2.0'

# 添加development环境下测试环境的依赖
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

# 开发环境依赖
group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"
end
```

**安装依赖**

1. 已经存在gemfile里, 打开注释 `bundle install` 安装依赖

**依赖版本**

企业及开发中, 都需要指定版本. 版本指定方法
```rb
"=1.0" 等于
"!=1.0" 不等于
">1.0" 大于
"<1.0" 小于
">=1.0" 大于等于
"<=1.0" 小于等于

"~>1.0.0" 会安装 1.0.1 这样的版本, 不会安装 1.1.0 这样的版本  ~ 控制小版本号

# 组合使用
gem 'mysql', '>=0.3.18', '< 0.6.0' 大于等于 0.3.8. 小于 0.6.0
```

Gemfile.lock 相当于锁定了版本, 更改了Gemfile 版本, 需要再次安装,才会再次更新该文件, 不应该手动更新



### 如何引用 Git 依赖

有时候引用的 Gem 可以不在官方仓库中, 而只有源码, 如果是 git, 引用很方便

1. 引用单个Git 仓库
```rb
gem 'rake', git: 'https://github.com/rack/rack'
```

2. 指定版本
```rb
gem 'nokogiri', '1.7.0.1', git: 'https://github.com/xx/xx'
```

3. 多个仓库
如果多个gem来自同一个 Git, 那么每次指定完整地址比较麻烦,后面修改也不方便, 可以定义一个源
```rb
git_source(:github) { |repo| "https://github.com/#{repo}.com" }

# 用名称引用
gem 'rack', github: 'rack/rack'
gem 'nokogiri', '1.7.0.1', github: 'xxx/xx'
```

4. 使用不同的协议
```rb
gem 'rake', git: 'https://github.com/rack/rack'
gem 'rake', git: 'git@github.com:rack/rack.git'
# ...
```


















