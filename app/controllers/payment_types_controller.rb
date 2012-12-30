class PaymentTypesController < ApplicationController
  load_and_authorize_resource

  def create
    @payment_type.save
    respond_with @payment_type
  end

  def update
    @payment_type.update_attributes(params[:payment_type])
    respond_with @payment_type
  end

  def destroy
    @payment_type.destroy
    respond_with @payment_type
  end
end
