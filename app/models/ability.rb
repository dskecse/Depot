class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    @user.persisted? && @user.role ? send(@user.role.to_sym) : guest
  end

  def admin
    can :manage, :all
    cannot :destroy, User, id: @user.id
  end

  def user
    can :manage, LineItem, cart: @user.cart
    can :manage, Order, user_id: @user.id
    can :manage, User, id: @user.id
    can :manage, Cart, id: @user.cart.id
    cannot :manage, Product
  end

  def guest; end
end
