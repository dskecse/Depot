require 'spec_helper'

describe ProductsController do
  before(:each) { @product = FactoryGirl.create(:product) }
  login_admin

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all products as @products" do
      get :index
      assigns(:products).should eq([@product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      get :show, { id: @product.to_param }
      assigns(:product).should eq(@product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      get :edit, { id: @product.to_param }
      assigns(:product).should eq(@product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        Product.any_instance.stub(:save).and_return(false)
        post :create, { product: {} }
        assigns(:product).should be_a_new(Product)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        Product.any_instance.should_receive(:update_attributes).with({ 'price' => @product.price.to_s })
        put :update, { id: @product.to_param, product: { price: @product.price } }
      end

      it "assigns the requested product as @product" do
        put :update, { id: @product.to_param, product: { price: @product.price } }
        assigns(:product).should eq(@product)
      end

      it "redirects to the product" do
        put :update, { id: @product.to_param, product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        response.should redirect_to(@product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        Product.any_instance.stub(:save).and_return(false)
        put :update, { id: @product.to_param, product: {} }
        assigns(:product).should eq(@product)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      expect {
        delete :destroy, { id: @product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, { id: @product.to_param }
      response.should redirect_to(products_url)
    end
  end
end
