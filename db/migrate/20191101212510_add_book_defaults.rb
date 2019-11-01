class AddBookDefaults < ActiveRecord::Migration[6.0]
  def change
    change_column_default :books, :copies, 0
    change_column_default :books, :available, 0
  end
end
