class Role < ActiveRecord::Base
  has_many :users
  
  serialize :actions

  validate :validate_actions

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

  private

  #
  # custom validators
  #

  def validate_actions
    errors.add(:actions, :invalid) if (actions - Action.all).any?
  end
end
