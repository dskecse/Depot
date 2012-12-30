class PaymentTypesController < ApplicationController
  load_and_authorize_resource

  def create
    flash[:notice] = 'Payment type was successfully created.' if @payment_type.save
    respond_with @payment_type
  end

  def update
    if @payment_type.update_attributes(params[:payment_type])
      flash[:notice] = 'Payment type was successfully updated.'
    end
    respond_with @payment_type
  end

  def destroy
    @payment_type.destroy
    respond_with @payment_type
  end
end
