class Role < ActiveRecord::Base
  has_many :users
  validate :validate_actions
  serialize :actions

  def validate_actions
    errors.add(:actions, :invalid) if (actions - Action.all).any?
  end

  rails_admin do
    edit do
      field :name
      field :description
      field :actions do
        partial :edit_roles
      end
      field :users
    end
  end

  Action.all.each do |action|
    define_method("#{action}_allowed?") do
      actions.include?(action)
    end
  end
end
