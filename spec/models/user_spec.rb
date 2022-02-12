require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  it "名前、メール、パスワードがあれば有効な状態" do
    user = User.new(
      name: "example",
      email: "example@mail.com",
      password: "password")
    expect(user).to be_valid
  end
  
  it "名前がなければ無効な状態" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
  end
  
  it "メールアドレスがなければ無効な状態" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
  end
  
  it "重複したメールアドレスなら無効な状態" do
    FactoryBot.create(
      :user,
      email: "taro@example.com")
    user = FactoryBot.build(
      :user,
      email: "taro@example.com")
    user.valid?
  end
end
