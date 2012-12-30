require 'spec_helper'

describe PaymentTypesController do
  before(:each) { @payment_type = FactoryGirl.create(:payment_type) }
  login_admin

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all payment_types as @payment_types" do
      get :index
      assigns(:payment_types).should eq([@payment_type])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_type as @payment_type" do
      get :show, { id: @payment_type.to_param }
      assigns(:payment_type).should eq(@payment_type)
    end
  end

  describe "GET new" do
    it "assigns a new payment_type as @payment_type" do
      get :new
      assigns(:payment_type).should be_a_new(PaymentType)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_type as @payment_type" do
      get :edit, { id: @payment_type.to_param }
      assigns(:payment_type).should eq(@payment_type)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new PaymentType" do
        expect {
          post :create, { payment_type: { name: 'Yandex.money' } }
        }.to change(PaymentType, :count).by(1)
      end

      it "assigns a newly created payment_type as @payment_type" do
        post :create, { payment_type: { name: 'Yandex.money' } }
        assigns(:payment_type).should be_a(PaymentType)
        assigns(:payment_type).should be_persisted
      end

      it "redirects to the created payment_type" do
        post :create, { payment_type: { name: 'Yandex.money' } }
        response.should redirect_to(PaymentType.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved payment_type as @payment_type" do
        PaymentType.any_instance.stub(:save).and_return(false)
        post :create, { payment_type: {} }
        assigns(:payment_type).should be_a_new(PaymentType)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested payment_type" do
        PaymentType.any_instance.should_receive(:update_attributes).with({ 'name' => 'Yandex.money' })
        put :update, { id: @payment_type.to_param, payment_type: { 'name' => 'Yandex.money' } }
      end

      it "assigns the requested payment_type as @payment_type" do
        put :update, { id: @payment_type.to_param, payment_type: { name: 'Yandex.money' } }
        assigns(:payment_type).should eq(@payment_type)
      end

      it "redirects to the payment_type" do
        put :update, { id: @payment_type.to_param, payment_type: { name: 'Yandex.money' } }
        response.should redirect_to(@payment_type)
      end
    end

    context "with invalid params" do
      it "assigns the payment_type as @payment_type" do
        PaymentType.any_instance.stub(:save).and_return(false)
        put :update, { id: @payment_type.to_param, payment_type: {} }
        assigns(:payment_type).should eq(@payment_type)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested payment_type" do
      expect {
        delete :destroy, { id: @payment_type.to_param }
      }.to change(PaymentType, :count).by(-1)
    end

    it "redirects to the payment_types list" do
      delete :destroy, { id: @payment_type.to_param }
      response.should redirect_to(payment_types_url)
    end
  end
end
