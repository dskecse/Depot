require 'spec_helper'

describe CartsController do
  before(:each) { @cart = FactoryGirl.create(:cart) }

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all carts as @carts" do
      get :index
      assigns(:carts).should eq([@cart])
    end
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      get :show, { id: @cart.to_param }
      assigns(:cart).should eq(@cart)
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      get :new
      assigns(:cart).should be_a_new(Cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      get :edit, { id: @cart.to_param }
      assigns(:cart).should eq(@cart)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, { cart: {} }
        }.to change(Cart, :count).by(1)
      end

      it "assigns a newly created cart as @cart" do
        post :create, { cart: {} }
        assigns(:cart).should be_a(Cart)
        assigns(:cart).should be_persisted
      end

      it "redirects to the created cart" do
        post :create, { cart: {} }
        response.should redirect_to(Cart.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cart as @cart" do
        Cart.any_instance.stub(:save).and_return(false)
        post :create, { cart: {} }
        assigns(:cart).should be_a_new(Cart)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cart" do
        Cart.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: @cart.to_param, cart: { 'these' => 'params' }}
      end

      it "assigns the requested cart as @cart" do
        put :update, { id: @cart.to_param, cart: {} }
        assigns(:cart).should eq(@cart)
      end

      it "redirects to the cart" do
        put :update, { id: @cart.to_param, cart: {} }
        response.should redirect_to(@cart)
      end
    end

    describe "with invalid params" do
      it "assigns the cart as @cart" do
        Cart.any_instance.stub(:save).and_return(false)
        put :update, { id: @cart.to_param, cart: {} }
        assigns(:cart).should eq(@cart)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      expect {
        delete :destroy, { id: @cart.to_param }
      }.to change(Cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      delete :destroy, { id: @cart.to_param }
      response.should redirect_to(carts_url)
    end
  end

end
