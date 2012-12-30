class ProductsController < ApplicationController
  load_and_authorize_resource

  respond_to :atom, only: :who_bought

  def create
    @product.save
    respond_with @product
  end

  def update
    @product.update_attributes(params[:product])
    respond_with @product
  end

  def destroy
    @product.destroy
    respond_with @product
  end

end
