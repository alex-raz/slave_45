class BookWish < ApplicationRecord
  def self.balance
    initial_balance = 6000
    spent_amount = sum(:price_rub)

    initial_balance - spent_amount
  end

  def in_process?
    applied || performed
  end

  validates_presence_of :title, message: 'не может быть пустым в нашем эксклюзивном сервисе'
  validates_presence_of :book_url, message: 'не может быть пустым в нашем эксклюзивном сервисе'
  validates_presence_of :price_rub, message: 'не может быть пустым в нашем эксклюзивном сервисе'
  validates_numericality_of :price_rub, greater_than_or_equal_to: 1, message: 'вот не надо тут нулей и отрицательностей всяких!..'
  validates_numericality_of :price_rub, less_than_or_equal_to: BookWish.balance, message: 'Слава, мы тебя любим, но не настолько сильно. Умерь свои хотелки немного.'
end
