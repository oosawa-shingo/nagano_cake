class OrderDetail < ApplicationRecord
  has_one_attached :image

  belongs_to :order

end
