class Action
  EDIT_ACTIONS = [:edit_categories, :edit_products, :edit_reviews, :edit_roles, :edit_users]
  DESTROY_ACTIONS = [:destroy_categories, :destroy_products, :destroy_reviews, :destroy_roles, :destroy_users]
  ACTIONS = [:create_categories, :create_products, :create_reviews, :create_roles] + EDIT_ACTIONS + DESTROY_ACTIONS

  def self.all
    ACTIONS
  end

  def self.admin_actions
    ACTIONS - [:create_reviews]
  end
end