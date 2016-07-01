class Action
  ACTIONS = [:create_categories, :create_products, :create_reviews,
             :edit_categories, :edit_products, :edit_reviews,
             :delete_categories, :delete_products, :delete_reviews]
  def self.all
    ACTIONS
  end

  def self.create_review?(user)
    user.role.actions.include?(:create_reviews)
  end
end