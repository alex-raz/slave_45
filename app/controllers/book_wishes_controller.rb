class BookWishesController < ApplicationController
  before_action :set_book_wish, only: [:edit, :update, :destroy]

  def index
    @book_wishes = BookWish.all
  end

  def new
    @book_wish = BookWish.new
  end

  def edit
  end

  def create
    @book_wish = BookWish.new(book_wish_params)

    if @book_wish.save
      redirect_to book_wishes_url, notice: 'Book wish was successfully created.'
    else
      render :new
    end
  end

  def update
    if @book_wish.update(book_wish_params)
      redirect_to book_wishes_url, notice: 'Book wish was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book_wish.destroy
    redirect_to book_wishes_url, notice: 'Book wish was successfully destroyed.'
  end

  private
    def set_book_wish
      @book_wish = BookWish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_wish_params
      params.require(:book_wish).permit(:title, :book_url, :price_rub)
    end
end
