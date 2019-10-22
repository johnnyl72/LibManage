json.extract! book, :id, :title, :isbn, :copies, :available, :created_at, :updated_at
json.url book_url(book, format: :json)
