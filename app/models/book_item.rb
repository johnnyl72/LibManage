class BookItem < ApplicationRecord

  has_one :loan
  has_one :user, through :loans
  belongs_to :book

end
