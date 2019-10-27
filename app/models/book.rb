class Book < ApplicationRecord

  belongs_to :book
  has_one :book_item

end
