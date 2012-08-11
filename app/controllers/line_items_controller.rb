class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
    respond_with @line_items
  end

  def show
    @line_item = LineItem.find(params[:id])
    respond_with @line_item
  end

  def new
    @line_item = LineItem.new
    respond_with @line_item
  end

  def edit
    @line_item = LineItem.find(params[:id])
    respond_with @line_item
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    respond_with @line_item, location: @line_item.cart if @line_item.save
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      flash[:notice] = 'Line item was successfully updated.'
    end
    respond_with @line_item
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice] = 'Line item was successfully destroyed.' if @line_item.destroy
    respond_with @line_item, location: @line_item.cart
  end
end
