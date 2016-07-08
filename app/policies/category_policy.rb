class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.create_categories_allowed? if user
      when :edit
        user.role.edit_categories_allowed? if user
      when :destroy
        user.role.destroy_categories_allowed? if user
      else super
    end
  end
end
