class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def rails_admin?(action)
    case action
      when :new
        user.role.create_products_allowed? if user
      when :edit
        user.role.edit_products_allowed? if user
      when :destroy
        user.role.destroy_products_allowed? if user
      else super
    end
  end
end
