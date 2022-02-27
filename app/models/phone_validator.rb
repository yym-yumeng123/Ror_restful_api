=begin
手机号格式自定义验证器，放models目录，放其他目录会报错
=end
class PhoneValidator < ActiveModel::Validator

  # 该方法会在对验证的时候调用
  # record为要验证的对象，这里为User
  def validate(record)
    if record.phone
      # =~：是正则匹配
      # 表示phone如果不匹配后面的正则格式，就进入代码块
      # unless 和 if 相反
      unless record.phone =~ /^[1](([3][0-9])|([4][5,7,9])|([5][4,6,9])|([6][6])|([7][3,5,6,7,8])|([8][0-9])|([9][8,9]))[0-9]{8}$/i
        # 如果出错了，像errors中phone的列表中添加一条消息
        record.errors[:phone] << 'is not an phone'
      end
    else
      record.errors[:phone] << "can't be blank"
    end
  end
end