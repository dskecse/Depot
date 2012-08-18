class OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, alert: 'Your cart is empty.'
      return
    end
    @order = Order.new
    respond_with @order
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:notice] = 'Thank you for your order.'
    else
      @cart = current_cart
    end
    respond_with @order, location: root_path
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = 'Order was successfully updated.'
    end
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = 'Order was successfully destroyed.'
    respond_with @order
  end
end
