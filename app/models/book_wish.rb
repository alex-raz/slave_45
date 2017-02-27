class BookWish < ApplicationRecord
  validates :title, :book_url, :price_rub, presence: true
end
