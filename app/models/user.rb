class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true

    validates :email, uniqueness: true

    # 全角ひらがな、全角カタカナ、漢字
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

    # 全角カタカナ
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday, presence: true
  end
end
