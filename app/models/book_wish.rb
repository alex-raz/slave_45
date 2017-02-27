class BookWish < ApplicationRecord
  validates :title, :book_url, presence: true
end
