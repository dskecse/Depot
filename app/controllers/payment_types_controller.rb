class PaymentTypesController < ApplicationController
  def index
    @payment_types = PaymentType.all
    respond_with @payment_types
  end

  def show
    @payment_type = PaymentType.find(params[:id])
    respond_with @payment_type
  end

  def new
    @payment_type = PaymentType.new
    respond_with @payment_type
  end

  def edit
    @payment_type = PaymentType.find(params[:id])
    respond_with @payment_type
  end

  def create
    @payment_type = PaymentType.new(params[:payment_type])
    if @payment_type.save
      flash[:notice] = 'Payment type was successfully created.'
    end
    respond_with @payment_type
  end

  def update
    @payment_type = PaymentType.find(params[:id])
    if @payment_type.update_attributes(params[:payment_type])
      flash[:notice] = 'Payment type was successfully updated.'
    end
    respond_with @payment_type
  end

  def destroy
    @payment_type = PaymentType.find(params[:id])
    @payment_type.destroy
    respond_with @payment_type
  end
end
