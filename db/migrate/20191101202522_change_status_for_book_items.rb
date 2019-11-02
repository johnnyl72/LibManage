class ChangeStatusForBookItems < ActiveRecord::Migration[6.0]
  def change
    change_column :book_items, :status, :integer, default: 0
  end
end
