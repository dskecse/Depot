class ProductsController < ApplicationController
  load_and_authorize_resource

  respond_to :atom, only: :who_bought

  def create
    flash[:notice] = 'Product was successfully created.' if @product.save
    respond_with @product
  end

  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
    end
    respond_with @product
  end

  def destroy
    flash[:notice] = 'Product was successfully destroyed.' if @product.destroy
    respond_with @product
  end

end
