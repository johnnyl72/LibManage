class BookItem < ApplicationRecord

  has_one :loan
  has_one :user, through: :loan
  belongs_to :book

end
