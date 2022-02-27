# 继承EachValidator类，好处是即可以使用自定义验证，也能使用自带验证
class EmailValidator < ActiveModel::EachValidator
  # 记录、属性名和属性值。它们分别对应模型实例、要验证的属性及其值。
  # User email value
  def validate_each(record, attribute, value)
    if value
      unless value =~ /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    else
      record.errors[attribute] << ("can't be blank")
    end
  end
end