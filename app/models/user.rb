class User < ActiveRecord::Base
  has_many :reviews
  belongs_to :role

  before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role.actions.to_set == Action.all.to_set
  end

  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
