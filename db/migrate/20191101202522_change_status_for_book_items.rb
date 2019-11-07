class ChangeStatusForBookItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :book_items, :status, :string
    add_column :book_items, :status, :integer, default: 0
  end
end
