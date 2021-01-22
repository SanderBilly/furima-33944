require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "必要な情報を適切に入力すれば新規登録ができる" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと新規登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it "emailが空だと新規登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
    end
    it "passwordが空だと新規登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
    it "passwordが存在してもpassword_confirmationが空だと新規登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it "first_nameが空だと新規登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "名前は不正な値です"
    end
    it "last_nameが空だと新規登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字は不正な値です"
    end
    it "first_name_kanaが空だと新規登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "名前(カナ)は不正な値です"
    end
    it "last_name_kanaが空だと新規登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字(カナ)は不正な値です"
    end
    it "birthdayが空だと新規登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "生年月日を入力してください"
    end
    
    it "重複したemailが存在する場合新規登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
    end
    it "emailに@が含まれていなければ新規登録できない" do
      @user.email = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
    end
    it "passwordが半角英数字混合でなければ新規登録できない" do
      password = "123456"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは不正な値です"
    end
    it "passwordが半角英数字混合でも6文字未満だと新規登録できない" do
      password = "123ab"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
    end
    it "first_nameが全角(漢字・ひらがな・カタカナ)での入力でなければ新規登録できない" do
      @user.first_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "名前は不正な値です"
    end
    it "last_nameが全角(漢字・ひらがな・カタカナ)での入力でなければ新規登録できない" do
      @user.last_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字は不正な値です"
    end
    it "first_name_kanaが全角(カタカナ)での入力でなければ新規登録できない" do
      @user.first_name_kana = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "名前(カナ)は不正な値です"
    end
    it "last_name_kanaが全角(カタカナ)での入力でなければ新規登録できない" do
      @user.last_name_kana = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字(カナ)は不正な値です"
    end
  end
end
