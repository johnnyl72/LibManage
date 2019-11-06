class BookItem < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  enum status: { available: 0, loaned: 1, shelving: 2 }

  has_one :loan
  has_one :user, through: :loan
  has_many :line_items

  belongs_to :book, counter_cache: :copies

  after_save :update_avail
  after_destroy :update_avail

  private
    def update_avail
      self.book.available = self.book.book_items.available.count
      self.book.save
    end

    def not_referenced_by_any_line_item
     unless line_items.empty?
       errors.add(:base, "Line items present")
       throw :abort
     end
   end

end
