class BooksController < ApplicationController

  before_action :set_book, only:[:show, :edit, :update, :destroy, :update_draft_status]

  def index
    @books = Book.all
  end

  def index_user
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def update_draft_status
    if @book.is_draft
      @book.update_attributes(is_draft: false)
      render :show, info: 'Book is undraft'
    else
      @book.update_attributes(is_draft: true)
      render :show, info: 'Book is undraft'
    end
  end

  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save
      redirect_to @book, success: 'Book succesfully created'
    else
      render :new
    end
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to @book, info: 'Book succesfully updated'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, success: 'Book successfully deleted'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :owner_id, :owner_nickname, :envelope, :all_tags, :file)
  end

end
