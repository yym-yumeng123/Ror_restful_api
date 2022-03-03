### 使用jbuilder自定义JSON格式

```json
// 有些字段我们不希望都返回出去, 只穿用户需要的
{
  "id": 58,
  "nickname": "这是昵称100",
  "avatar": null,
  "description": null,
  "gender": 0,
  "birthday": null,
  "phone": "13141111126",
  "email": null,
  "password_digest": "$2a$10$qre4lTAVJRRvb7Xr8ilvX.9lhSH/ZOWZFL6SSl9yvaMUPHtHcZAyW",
  "remember_digest": null,
  "created_at": "2019-01-23T11:58:24.000Z",
  "updated_at": "2019-01-23T11:58:24.000Z"
}
```

假设我们期待其他格式

```json
{
  "data": {
    "id": 58,
    "nickname": "这是昵称100",
    "phone": "13141111126",
    "created_at": "2019-01-23T11:58:24.000Z",
    "updated_at": "2019-01-23T11:58:24.000Z"
  }
}

{
  "data": [
    {
      "id": 58,
      "nickname": "这是昵称100",
      "phone": "13141111126",
      "created_at": "2019-01-23T11:58:24.000Z",
      "updated_at": "2019-01-23T11:58:24.000Z"
    },
    {
      "id": 58,
      "nickname": "这是昵称100",
      "phone": "13141111126",
      "created_at": "2019-01-23T11:58:24.000Z",
      "updated_at": "2019-01-23T11:58:24.000Z"
    }
  ]
}
```

实现上面的功能, 使用 `jbuilder` 框架, 它是 Rails 官方提供的, 一个构建 `JSON API的工具`

### 安装

```
gem "jbuilder"
```

### 使用
使用很简单，和HTML差不多，先创建一个文件，里面写上JSON嵌套关系，访问对于的API就会渲染对于的文件，渲染完就是JSON。例如：这里先改写用户详情。

**创建用户详情jbuilder文件**


```rb
# app/views/v1/users/show.json.jbuilder  对应文件夹
# 调用data字段包裹里面的内容

json.data do
  # 添加@user上面的后面这个几个字段
  json.(@user, :id,:nickname,:avatar,:description,:gender,:birthday,:phone,:email,:created_at,:updated_at)
end
```

- 现在用`jbuilder`返回`json`，就`不能手动调用render`方法, 就是什么也不做，那么他就会渲染对应动作的文件，例如：index就对应index.json.jbuilder，show就对应show.json.jbuilder文件。