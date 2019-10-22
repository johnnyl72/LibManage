class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :user_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
