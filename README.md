学习至 章节9 快速入门 rails

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

### API
1. 用户
   - 手机号邮箱注册/登录
   - 第三方注册登录
   - 邮箱确认
   - 邮件验证码
   - 短信验证码
   - 重置密码
   - 绑定/解绑第三方账号
   - 实时退出
2. 广告资源
3. 歌单
   - 标签保存/更新
4. 歌曲
5. 标签
6. 视频
7. 评论
   - 回复评论
   - 点赞
   - 分页
8. 动态
9. 商品
10. 订单
   - 支付宝支付
   - 支付回调
   - 接口参数签名
   - 接口参数加密
   - 响应签名
   - 响应加密
11. 社交聊天
   - 聊天
   - 好友
   - 粉丝
12. OSS
13. 搜索
   - 歌单搜索
   - 用户搜索
   - 搜索建议

### 创建项目

1. 创建 docker 数据库
```
docker run -v ror_music:/var/lib/postgresql/data -p 5555:5432 -e POSTGRES_USER=
root -e POSTGRES_PASSWORD=123456 -d postgres:12.2
```

2. 创建 rails api 项目
```
rails new ror_music  --database=postgresql --api
```

3. 用户相关数据
```bash
# 创建用户相关数据
rails generate scaffold User nickname:string avatar:string description:string gender:integer birthday:date email:string phone:string password_digest:string session_digest:string reset_password_digest:string reset_password_sent_at:datetime confirmation_digest:string confirmed_at:datetime confirmation_sent_at:datetime qq_id:string qq_id_digest:string wechat_id:string wechat_id_digest:string --no-assets

# 执行迁移
rails db:migrate RAILS_ENV=development
```

4. 查看错误信息
```
user.errors.messages
user.errors[:nickname]
user.valid?
```