class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true

    # 全角ひらがな、全角カタカナ、漢字
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

    # 全角カタカナ
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday, presence: true

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  end
end
