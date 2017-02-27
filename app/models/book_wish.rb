class BookWish < ApplicationRecord
  validates :title, :book_url, :price_rub, presence: true

  def self.balance
    initial_balance = 6000
    spent_amount = sum(:price_rub)

    initial_balance - spent_amount
  end

  def in_process?
    applied || performed
  end
end
