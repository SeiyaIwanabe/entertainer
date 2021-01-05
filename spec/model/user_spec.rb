require 'rails_helper'

describe User do
  describe '#create' do
    
    it "ユーザー名が空欄の場合は無効" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("名前が空欄です。入力してください。")
    end
    
    it "ユーザー名が11文字以上の場合は登録できない" do
      user = build(:user, nickname: "a" * 11)
      expect(user).to be_invalid
    end
    
    it "ユーザー名が1文字以内の場合は登録できない" do
      user = build(:user, nickname: "a")
      expect(user).to be_invalid
    end
    
    it "ユーザー名が2文字以上10文字以内の場合は登録できる" do
      user = build(:user, nickname: "a" * 3)
      expect(user).to be_valid
    end

    it "メールアドレスが空欄の場合は無効" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが空欄です。入力してください。")
    end
    
    it "重複したメールアドレスがある場合登録できない" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("このメールアドレスはすでに使われています。")
    end

    it "パスワードが空欄の場合は登録出来ない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードが空欄です。入力してください。")
    end
    
    it "パスワードが7文字以内のときに登録出来ない" do
      user = build(:user, password: "a" * 7)
      expect(user).to be_invalid
    end

    it "パスワードに半角英数字以外の文字が含まれていいると登録でいない" do
      user = build(:user, password: "よりとも１１９２")
      expect(user).to be_invalid
    end

    it "確認用パスワードが空欄の場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("確認用パスワードが空欄です。入力してください。")
    end

    it "名前 メールアドレス パスワード 確認用パスワード全てのカラムを入力したときに登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    
  end

  describe '#update' do

    it "得意ジャンルが21文字以上の場合は登録出来ない" do
      user = build(:user, genre: "征夷大将軍として天才的な政治力を以って鎌倉の世を統治すること")
      user.valid?
      expect(user.errors[:genre]).to include("得意ジャンルは20文字以内で登録してください。")
    end

    it "得意ジャンルが20文字以内の場合は登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "自己紹介が141文字以上の場合は登録出来ない" do
      user = build(:user, introduction: "a" * 141)
      user.valid?
      expect(user.errors[:introduction]).to include("自己紹介文は140文字以内で登録してください。")
    end

    it "自己紹介文が140文字以内の場合は登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ユーザー名が空欄の場合は無効" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("名前が空欄です。入力してください。")
    end
    
    it "ユーザー名が11文字以上の場合は登録できない" do
      user = build(:user, nickname: "a" * 11)
      expect(user).to be_invalid
    end
    
    it "ユーザー名が1文字以内の場合は登録できない" do
      user = build(:user, nickname: "a")
      expect(user).to be_invalid
    end
    
    it "ユーザー名が2文字以上10文字以内の場合は登録できる" do
      user = build(:user, nickname: "a" * 3)
      expect(user).to be_valid
    end

  end
end