class Book < ApplicationRecord

  has_one_attached :image
  has_many :book_items, counter_cache: :copies

end
