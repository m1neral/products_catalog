class RolePolicy < ApplicationPolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.actions.include?('create_roles') if user
      when :edit
        user.role.actions.include?('edit_roles') if user
      when :destroy
        user.role.actions.include?('destroy_roles') if user
      else
        super
    end
  end
end