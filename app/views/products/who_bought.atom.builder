atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  feed.updated @latest_order.try(:updated_at)

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"

        # Table Header
        xhtml.table do
          xhtml.tr do
            xhtml.th "Product"
            xhtml.th "Quantity"
            xhtml.th "Total price"
          end

          # Each item in an order
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td number_to_pln_currency(item.total_price)
            end
          end

          # Total price
          xhtml.tr do
            xhtml.th "Total price", colspan: 2
            xhtml.th number_to_pln_currency(order.line_items.map(&:total_price).sum)
          end
        end

        # Pay type
        xhtml.p "Paid by #{order.pay_type}"
      end

      # Who placed an order
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end