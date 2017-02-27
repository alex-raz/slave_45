class BookWishesController < ApplicationController
  before_action :set_book_wish, only: [:edit, :update, :destroy]
  before_action :set_balance, only: [:edit, :new, :index, :create, :update]

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
      redirect_to book_wishes_url, notice: 'Ура! Теперь мы знаем чего ты хочешь!'
    else
      render :new
    end
  end

  def update
    if @book_wish.in_process?
      redirect_to book_wishes_url, alert: 'Неа, так не пойдет. Мы уже суетимся, а ты хотелку изменяешь..'
    elsif @book_wish.update(book_wish_params)
      redirect_to book_wishes_url, notice: 'Правда же здорово что мы не успели еще ничего сделать?'
    else
      render :edit
    end
  end

  def destroy
    if @book_wish.in_process?
      redirect_to book_wishes_url, alert: 'Неа, так не пойдет. Мы уже суетимся, а ты хотелку отменяешь..'
    else
      @book_wish.destroy
      redirect_to book_wishes_url, notice: 'Не очень-то и хотелось.. :('
    end
  end

  private
    def set_book_wish
      @book_wish = BookWish.find(params[:id])
    end

    def set_balance
      @balance = BookWish.balance
    end

    # Only allow a trusted parameter "white list" through.
    def book_wish_params
      params.require(:book_wish).permit(:title, :book_url, :price_rub)
    end
end
