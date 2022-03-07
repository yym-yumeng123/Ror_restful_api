1. `update_attribute name, value`
   - 更新单个属性并保存记录，无需通过正常的验证过程

2. `build(attributes = {}, &block)`
   - `current_user.ads.build(ad_params)`
```rb
class Person
  has_many :pets
end

person.pets.build
# => #<Pet id: nil, name: nil, person_id: 1>

person.pets.build(name: 'Fancy-Fancy')
# => #<Pet id: nil, name: "Fancy-Fancy", person_id: 1>

person.pets.build([{name: 'Spook'}, {name: 'Choo-Choo'}, {name: 'Brain'}])
# => [
#      #<Pet id: nil, name: "Spook", person_id: 1>,
#      #<Pet id: nil, name: "Choo-Choo", person_id: 1>,
#      #<Pet id: nil, name: "Brain", person_id: 1>
#    ]

person.pets.size  # => 5 # size of the collection
person.pets.count # => 0 # count from database
```

2. 有冒号 : 的方法会抛出异常

3. !结尾和 ?结尾都是Ruby方法命名习惯; ! 表示该方法会抛出异常

4. `User.find(id).ads`  => 返回对应的广告

5. `Ad.find(4).user` => 返回广告所属于的用户