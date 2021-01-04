require 'rails_helper'

describe User do
  describe '#create' do
    it "名前が空欄の場合は無効" do
      user = User.new(nickname: "", email: "test@test", password: "dancing00", password_confirmation: "dancing00")
      user.valid?
      expect(user.errors[:nickname]).to include("名前が空欄です。入力してください。")
    end

    it "メールアドレスが空欄の場合は無効" do
      user = User.new(nickname: "taro", email: "", password: "dancing00", password_confirmation: "dancing00")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが空欄です。入力してください。")
    end
  end
end