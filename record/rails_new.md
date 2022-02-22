### 创建 web 项目
```zsh
rails new myApp
```

### 创建 api 项目

```zsh
rails new myApp --api
```

### 指定数据库

```zsh
# 一个横线跟缩写, 两个横线跟全称
-d: --database

# 创建 mysql
rails new myApp --api -d mysql

# 创建 postgresql
rails new myApp --api -d postgresql
```


> ---------------------


### 数据库配置文件

rails 框架默认的数据库配置在 config/database.yml

- YAML 格式是专门用来写配置文件的语言

```yml
# SQLite. Versions 3.8.0 and up are supported.
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem "sqlite3"
#

# 默认的公用配置
default: &default
  adapter: sqlite3 # 适配器
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000 # 连接超时

# 开发环境
development:
  # *default 引用公共配置
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3

```


```yml
# mysql


default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: 
  timeout: 5000

development:
  <<: *default
  database: myapp_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: myapp_test

production:
  <<: *default
  database: myapp_production
```

- 环境变量配置数据库
```yml
DATABASE_URL="mysql2://mypass@localhost(:8080)/somedatabase"


production:
  url: <%= ENV['DATABASE_URL'] %>
```