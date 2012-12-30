class CartsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create, :update, :destroy]

  load_and_authorize_resource
  respond_to :js, only: :destroy

  def create
    flash[:notice] = 'Cart was successfully created.' if @cart.save
    respond_with @cart
  end

  def update
    if @cart.update_attributes(params[:cart])
      flash[:notice] = 'Cart was successfully updated.'
    end
    respond_with @cart
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_with @cart, location: root_path
  end
end
