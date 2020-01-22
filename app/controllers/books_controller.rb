class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 100)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = BookPdf.new(@books)
        send_data pdf.render, filename: 'Books.pdf',
                              type: "application/pdf",
                              disposition: 'inline'
      end
    end
  #  if session[:cart_id].blank?
  #    cart = Cart.create(status: "pending")
  #    session[:cart_id] = cart.id
  #  else
  #    cart = Cart.find(session[:cart_id])
  #  end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    #@authors = Author.all.collect {|a| [a.fullname, a.id]}
    #@themes = Theme.all.collect {|t| [t.name, t.id]}
    #@publishers = Publisher.all.collect {|pub| [pub.name, pub.id]}
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.author = Author.find_by(params[:author])#.book.create(params[:book])
    @book.theme = Theme.find_by(params[:name])#.book.create(params[:book])
    @book.publisher = Publisher.find_by(params[:name])#.book.create(params[:book])
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new } 
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
    @books = Book.all
    respond_to do |format|
      format.pdf do
        pdf = BookPdf.new
        send_data pdf.render, filename: 'Books.pdf',
                              type: "application/pdf",
                              disposition: 'inline'
      end
    end
  end

  #def add_to_cart
  #  if session[:cart_id].blank?
  #    cart = Cart.create(status: "pending")
  #    session[:cart_id] = cart.id
  #  else
  #    cart = Cart.find(session[:cart_id])
  #  end
  #    book = Book.find(params[:id])
  #    if cart.line_items.exists?(book_id: book.id)
  #      cart.line_items.find_by(book_id: book.id).increment! :quantity
  #      
  #    else
  #      cart.line_items.build(book_id: book.id, quantity: 1)
  #    end
  #    redirect_to cart_path(cart), notic: "#{book.name} was added to your cart!"
  #end

  #def remove_from_cart
  #  cart.line_item.delete(@book)
  #  redirect_to cart, notice: "#{@book.name} was successfuly delete from your cart!"
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author_id, :publisher_id, :theme_id, :publishing_date, :pages, :cover, :isbn, :age, :description, :price, :logo, {images: []})
    end
end
