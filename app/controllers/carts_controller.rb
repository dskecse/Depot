class CartsController < ApplicationController
  def index
    @carts = Cart.all
    respond_with @carts
  end

  def show
    @cart = Cart.find(params[:id])
    respond_with @cart
  end

  def new
    @cart = Cart.new
    respond_with @cart
  end

  def edit
    @cart = Cart.find(params[:id])
    respond_with @cart
  end

  def create
    @cart = Cart.new(params[:cart])
    flash[:notice] = 'Cart was successfully created.' if @cart.save
    respond_with @cart
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(params[:cart])
      flash[:notice] = 'Cart was successfully updated.'
    end
    respond_with @cart
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = 'Cart was successfully destroyed.' if @cart.destroy
    respond_with @cart
  end
end
