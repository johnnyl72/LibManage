class LineItem < ApplicationRecord
  belongs_to :book_item
  belongs_to :cart
end
