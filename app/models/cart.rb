class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_product(product)
    current_item = line_items.find_by_product_id(product.id)
    if current_item
      current_item.increment(quantity)
    else
      current_item = line_items.build(product_id: product.id, price: product.price)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
