class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.actions.include?('create_products') if user
      when :edit
        user.role.actions.include?('edit_products') if user
      when :destroy
        user.role.actions.include?('destroy_products') if user
      else
        super
    end
  end
end