class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.actions.include?(:create_categories) if user
      when :edit
        user.role.actions.include?(:edit_categories) if user
      when :destroy
        user.role.actions.include?(:destroy_reviews) if user
      else
        super
    end
  end
end