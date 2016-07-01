class Action
  EDIT_ACTIONS = %w(edit_categories edit_products edit_reviews edit_roles edit_users)
  DESTROY_ACTIONS = %w(destroy_categories destroy_products destroy_reviews destroy_roles destroy_users)
  CREATE_ACTIONS = %w(create_categories create_products create_reviews create_roles)

  def self.all
    CREATE_ACTIONS + DESTROY_ACTIONS + EDIT_ACTIONS
  end

  def self.admin_actions
    all - ['create_reviews']
  end
end