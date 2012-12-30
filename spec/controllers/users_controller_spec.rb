require 'spec_helper'

describe UsersController do
  before(:each) do
    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([@user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, { id: @user.to_param }
      assigns(:user).should eq(@user)
    end
  end
end
