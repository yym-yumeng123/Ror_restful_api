学习至 章节6

## Ruby



### Ruby 之 Hello World
```ruby
puts 'Hello World'
print 'Hello World'
```

### RVM
是一个命令行工具, 管理多版本 Ruby环境和切换
```ruby
rvm list known # 查看已知 ruby 版本
```

### MySQL 常用命令
```text
mysql -uroot -p // 连接localhost, 用户名 root, 密码后面输
mysql -uroot -p123456 // 直接给出密码
mysql -hlocalhost -uroot -p123456 // 指定数据库地址
mysql -h localhost -u root -p 123456 // 命令行和值之间可以加空格
```


### Docker 三剑客

`Docker machine`: 主要解决Docker运行环境问题, 因为 Docker 的实现是基于 Linux内核的 `cgroup` 技术.
`Docker Compose`: 主要是 `Dcoker 容器编排问题`, 例如: 一个应用里用到了, Nginx, MySQL, Redis等技术, 正式部署的时候总不能一个一个启动的, 所以就有编排, 就是讲一个应用的相关信息, 写到一个文件(yaml格式), 最后执行 `Compose` 相关命令, 就能实现容器的批量操作
`Docker Swarm`: 主要解决多台主机上多个容器调度部署问题, 例如: 我有 10台服务器, 上面部署了 Docker, 如果实现高可用, 就需要用一种技术将这些 Docker 整合到一起, 统一对外提供服务

`kubernetes` 简称 k8s, 是用8代替8个字符的缩写, 它是谷歌开源的一个容器编排引擎, 支持自动化部署, 大规模可伸缩, 应用容器化管理, 


### Docker 优势
**相比于宿主系统**

只要能安装 Docker, 能不受当前宿主机操作系统限制, 随意是用任意系统, 
- 例如: 当前有一个功能, 必须在 Ubuntu 上才能测试, 我们宿主机是windows, 没有 docker , 只能找一台 Ubuntu 电脑, 或者是用虚拟机, 有了Docker必须要在 Windows 安装 Docker, 启动一个 Ubuntu 容器就行

**相比于虚拟机**

由于 Docker 是直接使用操作系统的内核虚拟化, 所以相比 Vmvare等虚拟机更省资源, 虚拟化启动一般分钟级别吗Docker 秒级

**相比于传统部署环境**

有了 Docker , 可以在本地模拟客户环境, 依赖版本写入文件, 开发环境统一

**相比于普通开发环境**
可以使用 Docker 启动一个 Ubuntu, Centos, Redis, MySQL 等环境

**限制**
Docker 默认启动的没有可视化环境

### 安装按照官网提示安装

### 创建一个 Nginx

Docker 源(相当于一个安装包), 可以在官方镜像仓库中搜索(`https://hub.docker.com/`), 当然也可以在镜像中搜索

**搜索 nginx**
镜像名称前面有用户的表示第三方镜像, 没有的表示官方镜像, 官方镜像右侧也有 'official image' 文字, 在镜像详情, 可以查看镜像的描述, 版本, 使用说明
**创建一个 Nginx 容器**
```bash
docker pull nginx

docker run --rm --name yym -p 80:80 nginx:latest

docker run: 启动一个容器
--rm: 与出后, 自动删除该容器, 可以去掉
--name: 容器取一个名字
-p 端口映射, 这里的意思是将容器的 80端口映射到 当前掉脑的 80 端口, 
格式为:  主机端口:容器端口

nginx:latest: 标识最新的nginx镜像, latest 表示使用最新版本
```

### 创建一个MySQL

```bash
docker run --name yym -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:latest

docker run 运行一个容器
--name 容器名字
-p 端口映射 3306 mysql 默认端口
-e 环境变量
mysql:latest 最新版本

// 启动指定版本的MySQL
docker run --name yym -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

```

### 创建一个 Redis
```
docker run --name yym -p 6379:6379 redis:latest
```

### 常用Docker 命令
- 镜像相当于操作系统
- 容器相当于镜像创造的操作系统
```
docker ps  // 启动了哪些容器
docker ps -a // 查看所有容器
docker start 容器名称/容器id // 启动容器

docker stop 容器名称/容器id  // 停止容器
docker rm 容器名称/容器id  // 删除未运行的容器
docker rm -f 容器名称/容器id // 删除正在运行的容器

docker image // 查看本地镜像
docker rmi nginx:latest // 删除本地镜像

```