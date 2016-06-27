class User < ActiveRecord::Base
  has_many :reviews
  has_one :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    !!is_admin
  end
end
