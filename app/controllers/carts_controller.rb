class CartsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create, :update, :destroy]

  load_and_authorize_resource
  respond_to :js, only: :destroy

  def create
    @cart.save
    respond_with @cart
  end

  def update
    @cart.update_attributes(params[:cart])
    respond_with @cart
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_with @cart, location: root_path
  end
end
