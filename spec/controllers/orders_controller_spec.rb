require 'spec_helper'

describe OrdersController do
  before { @order = FactoryGirl.create(:order) }
  login_admin

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all orders as @orders" do
      get :index
      assigns(:orders).should eq([@order])
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      get :show, { id: @order.to_param }
      assigns(:order).should eq(@order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      cart = FactoryGirl.create(:cart)
      session[:cart_id] = cart.id
      FactoryGirl.create(:line_item, cart_id: cart.id)
      get :new
      assigns(:order).should be_a_new(Order)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      get :edit, { id: @order.to_param }
      assigns(:order).should eq(@order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, { order: { name: 'MyString', address: 'MyText', email: 'MyString', payment_type_id: 1 } }
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, { order: { name: 'MyString', address: 'MyText', email: 'MyString', payment_type_id: 1 } }
        assigns(:order).should be_a(Order)
        assigns(:order).should be_persisted
      end

      it "redirects to the root path" do
        post :create, { order: { name: 'MyString', address: 'MyText', email: 'MyString', payment_type_id: 1 } }
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        Order.any_instance.stub(:save).and_return(false)
        post :create, { order: {} }
        assigns(:order).should be_a_new(Order)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested order" do
        Order.any_instance.should_receive(:update_attributes).with({ 'name' => 'Dave Chelimsky' })
        put :update, { id: @order.to_param, order: { name: 'Dave Chelimsky' } }
      end

      it "assigns the requested order as @order" do
        put :update, { id: @order.to_param, order: { name: 'Dave Chelimsky' } }
        assigns(:order).should eq(@order)
      end

      it "redirects to the order" do
        put :update, { id: @order.to_param, order: { name: 'Dave Chelimsky' } }
        response.should redirect_to(@order)
      end
    end

    describe "with invalid params" do
      it "assigns the order as @order" do
        Order.any_instance.stub(:save).and_return(false)
        put :update, { id: @order.to_param, order: {} }
        assigns(:order).should eq(@order)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      expect {
        delete :destroy, { id: @order.to_param }
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      delete :destroy, { id: @order.to_param }
      response.should redirect_to(orders_url)
    end
  end
end
