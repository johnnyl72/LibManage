class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book_items
end
