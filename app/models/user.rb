class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :orders
  has_one :cart, dependent: :destroy

  validates :email, uniqueness: true

  ROLES = %w(admin user)

  def is?(user_role)
    self.role == user_role
  end
end
