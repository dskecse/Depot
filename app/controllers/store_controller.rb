class StoreController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @products = Product.order(:title)
    @cart = current_cart
  end
end
