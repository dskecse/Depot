class LineItemsController < ApplicationController
  respond_to :js, only: :create

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
    respond_with @line_item, location: root_path do |format|
      if @line_item.save
        format.js { @current_item = @line_item }
      end
    end
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
    respond_with @line_item, location: root_path
  end
end
