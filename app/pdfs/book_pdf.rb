class BookPdf < Prawn::Document
  def initialize(book)
    super()
    @book = book
    text "Books", size: 20, style: :bold
    items
  end

  def items
    move_down 20
    table item_rows do
      row(0).font_style = :bold
    end
  end

  def item_rows
    [["ID", "Title", "Price", "Author", "Publisher", "Theme", "Publishing_Date", "Pages", "Cover", "Age"]] +
    @book.map do |item|
      [item.id.to_s.parameterize, item.name.parameterize, item.price.to_s, item.author_id.to_s, item.publisher_id.to_s, item.theme_id.to_s, item.publishing_date.to_s, item.pages.to_s, item.cover.to_s.parameterize, item.age.to_s.parameterize]
    end
  end
end