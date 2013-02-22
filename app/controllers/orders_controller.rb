class OrdersController < ApplicationController
  load_and_authorize_resource except: :new

  def index
    @orders = @orders.includes(:payment_type).joins(:payment_type).page(params[:page]).per(10)
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, alert: I18n.t('.empty')
      return
    end
    @order = Order.new
    respond_with @order
  end

  def create
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      OrderNotifier.received(@order).deliver
      flash[:notice] = I18n.t('.thanks')
    else
      @cart = current_cart
    end
    respond_with @order, location: root_path
  end

  def update
    if @order.update_attributes(params[:order]) and @order.ship_date_changed?
      OrderNotifier.shipped(@order).deliver
    end
    respond_with @order
  end

  def destroy
    @order.destroy
    respond_with @order
  end
end
