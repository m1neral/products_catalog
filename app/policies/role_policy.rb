class RolePolicy < ApplicationPolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.create_roles_allowed? if user
      when :edit
        user.role.edit_roles_allowed? if user
      when :destroy
        user.role.destroy_roles_allowed? if user
      else
        super
    end
  end
end