### 添加应用版本标示

看到目前，应用没用一个版本号，如果不是能看出来的功能，都不知道项目是否真正的部署成功；同时如果测试提Bug，也不知道当前是那个版本；所以我们要添加一个版本，每次部署的前手动更改这个版本。

**版本如何展示**
现在实现的API应用，所以弄一个HTML页面肯定不好，所以我们就创建一个控制器，返回版本的JSON

**生成控制器**
- 这里的版本，我们就不保存到数据库，而是保存到一个文件，所以就不用创建模型，迁移了
- 只是需要创建一个控制器
```rb
# 生成Monitors控制器，version方法；因为我们想让当前类来做监控，后面可能会添加更多的信息，例如：当前应用状态，Redis状态等信息。
rails generate controller Monitors version
```

### 添加环境变量管理工具

在企业级开发中，代码中用到的App Key；密钥；数据库密码；第三方登录配置；支付宝，微信，统计等配置都不能直接写到代码中，防止泄露；推荐做法是在需要的位置，通过环境变量获取

**环境变量分享**
多人员共享：只需要将这个文件传给对于人员；将他和源码分开存储。
环境变量多：因为写到文件，只需要一个写，其他人更新就行了

**使用第三方框架**

使用`dotenv-rails`。他将所有的环境变量放到根目录的.env文件，如果本地有环境变量，就用设置的环境变量，没有就用该文件的

### linux 小知识
```zsh
# 要在同Shell下启动
export DATABASE_USERNAME=yym
echo $DATABASE_USERNAME # 查看
unset DATABASE_USERNAME # 删除
```

### 添加项目API版本

**如何区分版本**
1. 在Header中指定使用的版本
2. 在参数中指定
3. 通过URL地址, 使用这个
```rb
# 通过Ruby 命名空间来实现, v1, v2 就是不同的命名空间
第一版接口：/v1/users
第二版本：/v2/users
```
```rb
# 创建v1版本控制器
rails g controller v1::Users

# app/controllers/v1/users_controller.rb
class V1::UsersController < ApplicationController
end


# 配置路由
Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  # v1接口命名空间
  namespace :v1 do
    # 用户路由；相当于配置了所有方式
    resources :users
  end

end
```

### 默认错误处理

1. 请求成功: 返回 200, 或者201, 返回对象

2. 对象验证不通过: 手机号，邮箱格式都是不正确的，肯定不能保存到数据库，他返回422
```json
{
    "nickname": [
        "can't be blank"
    ]
}
```

3. 数据库验证不通过: 例如：手机号重复。返回500

```json
{
  // 是服务器返回的错误码
  "status": 500,
  // 对这个错误的一个简单描述
  "error": "Internal Server Error",
  // 就是错误详细信息
  "exception": "#<NoMethodError: undefined method `user_url' for #<V1::UsersController:0x00007f0104666a00>>",
  // 错误方法调用堆栈
  "traces": {
    "Application Trace": [
      {
        "id": 19,
        "trace": "app/controllers/v1/users_controller.rb:22:in `create'"
      }
    ],
    "Framework Trace": [
      {
        "id": 0,
        "trace": "actionpack (5.2.2) lib/action_dispatch/routing/polymorphic_routes.rb:281:in `handle_model_call'"
      }
    ]
  }
}
```

### 用户登录

1. 在 session create action 里面, 先登录参数校验, 然后 比较密码 `user.authenticated? (user.rb)`
2. 认证成功以后, 使用 `config/digest_util` 中的方法随机生成一个32位 base64 编码的数据
   - `DigestUtil.random_base64_32 => "DTcXIfPBpvibPlLDfh-VAdXXckp6ytSIdJckivus8s8"`
   - `DigestUtil.encrypt(DigestUtil.random_base64_32) => "$2a$12$.m1BGsMzibgMCvVkqDJ84.XQeuYiZDCDG9UwklGSjAa/dMncZQTFG"`
3. 更新 session_digest 属性, 成功返回 user: id, session: 加密数据
---
4. 用户身份认证, 判断是否是当前用户登录
   - 在 `Header 头里` user 属性使用 id, authorization 使用: session加密数据, 传进来