require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての項目に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end



    context '新規登録できない場合' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end



      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end



      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが英字のみでは登録できない' do
        @user.password = 'adcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが全角文字を含むものでは保存できない' do
        @user.password = '12ああ3456'
        @user.password_confirmation = '123ああ456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end



      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'nullo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaのフリガナが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaのフリガナが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaのフリガナがカタカナでないと登録できない' do
        @user.last_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaのフリガナがカタカナでないと登録できない' do
        @user.first_name_kana = 'nullo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end


      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end







    end
  end
end
