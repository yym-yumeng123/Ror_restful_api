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