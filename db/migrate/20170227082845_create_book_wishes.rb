class CreateBookWishes < ActiveRecord::Migration[5.0]
  def change
    create_table :book_wishes do |t|
      t.string :title
      t.string :book_url
      t.float :price_rub
      t.boolean :applied
      t.boolean :performed

      t.timestamps
    end
  end
end
