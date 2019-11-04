class ChangeBookToBookItemForLoans < ActiveRecord::Migration[6.0]
  def change
    rename_column :loans, :book_id, :book_item_id
  end
end
