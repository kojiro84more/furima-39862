## usersテーブル
| Type :Column, Options |
| ----------------------|
t.string :name, null: false
t.string :password, null: false
t.string :email null:false, unique:true



## profilesテーブル
| Type :Column, Options |
| ----------------------|
t.string :first_name,	null:false
t.string :family_name,	null:false
t.string :first_name_kana, null:false
t.string :family_name_kana,	null:false
t.date :birth_day, null:false
t.text :introduction,	
t.references :user null:false,foreign_key:true



## sending_destinationsテーブル
| Type :Column, Options |
| ----------------------|
t.string :destination_first_name,	null:false
t.string :destination_family_name, null:false
t.string :destination_first_name_kana,	null: false
t.string :destination_family_name_kana,	null: false
t.integer :post_code,	null:false
t.integer :prefecture_code,	null:false
t.string :city,	null:false
t.string :house_number,	null:false
t.string :building_name,	
t.integer :phone_number,	unique:true
t.references :user,	null: false,foreign_key:true



## credit_cardsテーブル
| Type :Column, Options |
| ----------------------|
t.integer :user_id,	null:false
t.string :customer_id,	null:false
t.string :card_id,	null:false



## itemsテーブル
| Type :Column, Options |
| ----------------------|
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



## item_imgsテーブル
| Type :Column, Options |
| ----------------------|
t.string :url,	null:false
t.references :item,	null:false,foreign_key:true



## commentsテーブル
| Type :Column, Options |
| ----------------------|
t.text :comment, null:false
t.references :user, null:false,foreign_key:true
t.references :item,	null:false,foreign_key:true



## categoriesテーブル
| Type :Column, Options |
| ----------------------|
t.string :name,	null:false
t.string :ancestry,	null:false
