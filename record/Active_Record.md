# 什么是 Active Record

Active Record 是 MVC 中的 M(模型), 负责处理数据和业务逻辑, Active Record 负责创建和使用需要持久存入数据库中的数据, Active Record 实现了 Active Record模式, 是一种对象关系映射系统.

### 什么是 Active Record 模式

在 Active Record 模式中, 对象中既有持久存储的数据, 也有针对数据的操作. Active Record模式把数据存取逻辑作为对象的一部分, 处理对象的用户知道如何把数据写入数据库, 还知道如何从数据库中读取数据, 简单来说: 一个模型既要字段保存保存数据, 还要知道自己如何存储到数据库, 从数据库读取, 但该模式有一定的弊端, 就是模型要继承它提供的类

### 什么是 ORM

对象关系映射 (Object Relational Mapping) 简称 ORM, 它是一种编程技术, 就是实现对象到 SQL的相互转换, 好处是应用层除特殊需求外, 基本不用使用 SQL


### 命名约定

数据库表名: 复数, 下划线分隔符(例如: book_clubs)
模型类名: 单数, 每个单词首字母大写(例如: BookClubs)

模型/类 => 表名
Article => articles
LineItem => line_items
Deer => deers
Mouse => mice
Person => people


---

# 数据库迁移

### 什么是数据库迁移文件

数据库迁移文件就是将以前用 sql 创建表, 删除表, 修改表等操作当道文件中,用框架的语法管理它

**优点**
以前用 sql 来操作, 坏处是自己需要管理哪些 sql 文件先执行, 哪些后执行等问题, 有了数据库迁移文件可以根据它的命名方式管理

**缺点**
降低了灵活性, 如果重新部署一个项目, 需要执行原来所有的迁移, 有时候迁移的内容是多余的

### 查看 Article 迁移文件名
```rb
# 迁移文件路径
db/migrate

# 前面创建的 article 
# 时间戳 + 迁移动作
202012121234_create_articles.rb

# 定义一个类, 继承 ActiveRecord::Migration 版本 7.0
class CreateArticles < ActiveRecord::Migration[7.0]
  # 定义 change 方法 表示对数据库的变更
  def change
    # 调用 create_table 创建一个表
    # articles 是表名
    create_table :articles do |t|
      # 这里配置表需要的字段

      # 类型 字段名 可选配置
      t.string :title
      t.string :content

      # 给模型 添加 create_at update_at 字段
      # 可以使用 update_at 字段实现缓存
      t.timestamps
    end
  end
end

```

### 执行迁移
```rb
# 开发环境
rails db:migrate RAILS_ENV=developemnt
rails db:migrate RAILS_ENV=production
```

### 迁移回滚
```zsh
# 回滚最后一个版本
rails db:rollback

1. User: name age
2. User: sex  => rollback 2 不要了
```

### 常用数据库命令
```zsh
rails dbconsole # => 以 SQL方式操作数据库

# rails 使用已有数据库
```

---

# Action Controller

### 什么是 Action Controller

MVC 中的 C (控制器), 翻译动作控制器, 简单说: 客户端请求一个 API 时, 服务端该在那个类中处理这个请求, 处理请求的那个类就是一个控制器

解析请求, 生成相应的输出

**命名约定**

最后一个单词使用复数



###  什么是路由

当客户端请求一个 API 时, 决定哪个类处理, 就是路由的功能








