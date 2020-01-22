class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

#  include CurrentCart
#  before_create :set_cart
def total_price
    book.price.to_f * quantity.to_i
  end
end
