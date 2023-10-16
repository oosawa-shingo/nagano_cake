class Order < ApplicationRecord
  has_one_attached :image

   has_many :order_details, dependent: :destroy
   belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_address: { "ご自身の住所": 0, "登録済み住所から選択": 1, "新しいお届け先":2 }

end
