  users
name	string	null: false
password	string	null: false
email	string	null:false, unique:true
  Association
has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :favorites, dependent: :destroy
has_one :profile, dependent: :destroy
has_one :sns_authentication, dependent: :destroy
has_one :sending_destination, dependent: :destroy
has_one :credit_card, dependent: :destroy


  root to: "items#index"


  profiles
first_name	string	null:false
family_name	string	null:false
first_name_kana	string	null:false
family_name_kana	string	null:false
birth_day	date	null:false
introduction	text	
user	references	null:false,foreign_key:true
  Association
belongs_to :user





  sending_destinations
destination_first_name	string	null:false
destination_family_name	string	null:false
destination_first_name_kana	string	null: false
destination_family_name_kana	string	null: false
post_code	integer(7)	null:false
prefecture_code	integer	null:false
city	string	null:false
house_number	string	null:false
building_name	string	
phone_number	integer	unique:true
user	references	null: false,foreign_key:true
  Association
belongs_to: user





  credit_cards
user_id	integer	null:false
customer_id	string	null:false
card_id	string	null:false
  Association
belongs_to: user





  items
name	string	null:false
introduction	text	null:false
price	integer	null:false
brand	text	null:false
item_condition	integer	null:false,foreign_key:true
postage_payer	integer	null:false,foreign_key: true
prefecture_code	integer	null:false
preparation_day	integer	null:false,foreign_key: true
category	references	null:false,foreign_key:true
trading_status	integer	
seller	references	null:false,foreign_key:true
buyer	references	foreign_key:true
      t.string :name, null:false
      t.text :introduction, null:false
      t.integer :price, null:false
      t.text :brand, null:false
      t.integer :item_condition, null:false,foreign_key:true
      t.integer :postage_payer, null:false,foreign_key: true
      t.integer :prefecture_code, null:false
      t.integer :preparation_day, null:false,foreign_key: true
      t.references :category,	null:false,foreign_key:true
      t.integer :trading_status	
      t.references :seller, null:false,foreign_key:true
      t.references :buyer, foreign_key:true
  Association
has_many :comments, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :item_imgs, dependent: :destroy
belongs_to :category
belongs_to :user




  item_imgs
url	string	null:false
item	references	null:false,foreign_key:true
  Association
belongs_to :item





  comments
comment	text	null:false
user	references	null:false,foreign_key:true
item	references	null:false,foreign_key:true
  Association
belongs_to :user
belongs_to :item





  categories
name	string	null:false
ancestry	string	null:false
  Association
has_many :items

