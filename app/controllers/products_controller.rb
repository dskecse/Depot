class ProductsController < ApplicationController
  respond_to :atom, only: :who_bought

  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  def new
    @product = Product.new
    respond_with @product
  end

  def edit
    @product = Product.find(params[:id])
    respond_with @product
  end

  def create
    @product = Product.new(params[:product])
    flash[:notice] = 'Product was successfully created.' if @product.save
    respond_with @product
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
    end
    respond_with @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product was successfully destroyed.' if @product.destroy
    respond_with @product
  end

  def who_bought
    @product = Product.find(params[:id])
    respond_with @product
  end
end
