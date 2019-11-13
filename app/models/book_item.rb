class BookItem < ApplicationRecord
  enum status: { available: 0, loaned: 1, shelving: 2 }

  has_one :loan
  has_one :user, through: :loan
  belongs_to :book, counter_cache: :copies

  after_save :update_avail
  after_destroy :update_avail

  def id_f
    "%06d" % id
  end

  private
  def update_avail
    self.book.available = self.book.book_items.available.count
    self.book.save
  end
end
