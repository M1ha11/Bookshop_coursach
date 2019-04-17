json.extract! book, :id, :title, :price, :description, :theme, :publisher, :date_published, :pages, :cover, :isbn, :age, :created_at, :updated_at
json.url book_url(book, format: :json)
