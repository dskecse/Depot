class LineItemsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create, :decrement, :destroy]

  load_and_authorize_resource
  respond_to :js, only: [:create, :destroy, :decrement]

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    respond_with @line_item, location: root_path do |format|
      format.js { @current_item = @line_item } if @line_item.save
    end
  end

  def update
    @line_item.update_attributes(params[:line_item])
    respond_with @line_item
  end

  def destroy
    @line_item.destroy
    respond_with @line_item, location: root_path do |format|
      format.js { @cart = current_cart }
    end
  end

  def decrement
    @line_item.quantity > 1 ? @line_item.decrement(:quantity) : @line_item.destroy
    @line_item.save
    respond_with @line_item, location: root_path do |format|
      format.js { @cart = current_cart }
    end
  end
end
