class Cart < ApplicationRecord
  #belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_book(book)
    current_item = line_items.find_by(book_id: book.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(book_id: book.id)
    end
    current_item
  end

end
