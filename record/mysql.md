## Docker 安装mysql

### MySQL 常用命令

```zsh
# 连接localhost, 用户名 root, 密码后面输
mysql -uroot -p
# 直接给出密码
mysql -uroot -p123456
# 指定数据库地址
mysql -hlocalhost -uroot -p123456 
# 命令行和值之间可以加空格
mysql -h localhost -u root -p 123456 
```
### 数据库相关命令
```zsh
`show database` 查看数据库
`create database name` 创建数据库

指定编码, mysql 默认 utf-8 三个字节, 如果mysql需要支持 Emoji, 需要更改表的编码, 该编码用4个字节保存每个字符
`CREATE DATABASE name DEFAULT character set utf8mb4 collate utf8mb4_general_ci`

选择数据库 `use name`
删除数据库 `drop database name`
查看数据库创建语句 `SHOW CREATE DATABASE name`
```

### 表相关命令
```zsh
# 查看表
show tables 

# id int 值, 主键 自增长, name
CREATE TABLE users(id INTEGER PRIMARY KEY  AUTO_INCREMENT, name VAECHAR(100) NOT_NULL, age INTEGER) 创建表

# 删除表
drop table users

# 查看表创建语句
show create table users

# 查看表的每列详情
show full columns from users
```

### mysql Workbench

是 mysql 官方提供的 可视化工具, 它可以对数据库, 表进行操作, 还可以绘制 ER图,