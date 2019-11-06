class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy


  def add_book_item(book_item)
    current_item = line_items.find_by(book_item_id: book_item.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(book_item_id: book_item.id)
    end
      current_item
  end

end
