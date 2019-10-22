class CreateBookItems < ActiveRecord::Migration[6.0]
  def change
    create_table :book_items do |t|
      t.string :status
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
