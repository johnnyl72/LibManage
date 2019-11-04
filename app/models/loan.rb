class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book_item

  after_create :update_loan_status

  private
  def update_loan_status
    self.book_item.status = 'loaned'
    self.book_item.save
  end
end
