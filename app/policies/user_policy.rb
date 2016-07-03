class UserPolicy < ApplicationPolicy
  attr_reader :user, :user_resource

  def initialize(user, user_resource)
    @user = user
    @user_resource = user_resource
  end

  def rails_admin?(action)
    case action
      when :new
        false
      when :edit
        user.role.edit_users_allowed? if user
      when :destroy
        user.role.destroy_users_allowed? if user
      else
        super
    end
  end
end