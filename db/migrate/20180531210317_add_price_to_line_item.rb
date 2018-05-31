class AddPriceToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :price, :decimal
    LineItem.all do |line_item|
      li.price = li.product.price
    end
  end
end
