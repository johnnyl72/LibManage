json.extract! book_item, :id, :status, :book_id, :created_at, :updated_at
json.url book_item_url(book_item, format: :json)
