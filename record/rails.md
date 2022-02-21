### API相关概念

API: Application Programming Interface 应用程序变成接口, 在我们软件开发, 网络 api

### 什么是 RESTful

- REST: `Representational State transfer` 表述性状态转移, 就是对资源的表述性状态转移
- 什么是表述性: 客户端请求一个资源, 服务器拿到这个资源, 就是表述性转移, 其实就是把客户端表述的信息传递到服务端
- 它是一种设计风格, 而不是标准, 提供一组设计原则的约束条件
- 这个风格以资源为中心, 例如: 用户 歌单 评论都是一个资源, 然后使用不同的动作操作一个资源, 比如: 添加, 删除, 列出 

### 什么事是 RESTful API 

就是符合 RESTful 架构的API接口设计, 

```
创建评论: POST /comments
评论列表: GET /comments
显示一个评论: GET /comments/评论id
更新评论: PUT/PATCH /comments/评论id
删除评论: DELETE .comments/评论id
```

> ------------------------------------

### Rails简介
Rails 时使用 Ruby语言编写的 Web应用开发框架

### Rails 设计哲学
- 不要自我重复
- 多约定, 少配置

### 什么是 Gem
Gem 是 Ruby 语言的依赖包格式, 类似于 node.js 的 npm

### Rails 安装

Rails 也是一个 Gem
```zsh
gem sources --add 镜像源 --remove 原本地址

gem source -l # 查看镜像源


gem install rails (--version=版本)

rails --version
```

> -------------------------------------

### Rails 脚手架相关

1. 创建 Api 项目

```zsh
# new 创建一个新项目
# --api 创建一个 api 项目
rails new 项目名称 --api
```

2. 目录简介
- Gemfile: 当前项目依赖的框架文件
- app/ 创建应用
- app/controllers 控制器, 负责接受请求, 响应请求
- app/models 数据模型, 可以映射到数据库
- app/views 视图层

- bin/ 可执行文件, 方便管理目录
- config/ 配置目录
   - config/database.yml 数据库配置
   - config/environment.rb 开发环境配置
   - config/initializers/ 初始化配置,在项目开始时, 运行一次
   - config/locales/ 国际化相关
   - config/puma rails 集成的是 puma 服务器,这是puma配置文件
   - config/routes.rb 路由相关


### 源码纳入版本控制

使用 git

### 启动 rails 项目

```zsh
rails server 启动服务器
rails s 简写
rails s -p 5000 指定端口
```

### Hello World

api 项目,  返回一个json,

1. 创建控制器
控制器, 路由器, 模型, 界面等数据可以手动创建, 也可以命令行创建, api 应用可以不要视图

2. 脚手架
脚手架可以同时创建控制器, 模型, 视图等信息, 但有时候我们不需要这些文件, 后续了解单独创建命令
```zsh
# generate 表示生成, 简写为 g
# scaffold 脚手架
# Article 模型名称, Rails 严格区分单数负数, 这里使用单数
# title:string 模型名称:类型 rails 的类型, 不是数据库的类型
# --no-assets 表示不生产 js html等类型文件

# 创建数据库迁移文件
rails generate scaffold Article title:string content:string --no-assets

# 运行数据库迁移
rails db:migrate
```