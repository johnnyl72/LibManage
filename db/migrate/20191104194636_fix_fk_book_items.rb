class FixFkBookItems < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :loans, :books
    add_foreign_key :loans, :book_items
  end
end
