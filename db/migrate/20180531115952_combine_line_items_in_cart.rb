class CombineLineItemsInCart < ActiveRecord::Migration[5.1]

  # Replace multiple items for a single product in a cart with a single item
  def up
    Cart.all.each do |cart|
      # Count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      # For each item
      sums.each do |product_id, quantity|

        # Check if it's quantity is more than 1
        if quantity > 1

          # If so delete all items associated with this product
          cart.line_items.where(product_id: product_id).delete_all

          # Build one item with proper quantity
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  # Split items with quantity greater than one into multiple items
  def down
    # For each cart
    Cart.all.each do |cart|
      # For each line item
      cart.line_items.each do |line_item|
        # If it's quantity is greater than 1
        if line_item.quantity > 1
          # Create multiple itemsof the same product with the quantity of 1
          line_item.quantity.times do
            cart.line_items.create(product_id: line_item.product.id,
                                  quantity: 1)
          end
          line_item.destroy
        end
      end
    end
  end

  # Split items with quantity greater than one into multiple items
  # def down
  #   LineItem.where('quantity>1').each do |line_item|

  #     # Add individual items
  #     line_item.quantity.times do
  #       LineItem.create(cart_id: line_item.cart_id, 
  #                       product_id: line_item.product_id, 
  #                       quantity: 1)
  #     end

  #     # Remove orginal item
  #     line_item.destroy
  #   end
  # end

end