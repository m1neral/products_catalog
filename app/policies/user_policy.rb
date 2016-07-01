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
        user.role.actions.include?('edit_users') if user
      when :destroy
        user.role.actions.include?('destroy_users') if user
      else
        super
    end
  end
end