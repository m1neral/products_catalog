class Action
  ACTIONS = [:create_categories, :create_products, :create_reviews,
             :read_categories, :read_products, :read_reviews,
             :edit_categories, :edit_products, :edit_reviews,
             :delete_categories, :delete_products, :delete_reviews]
  def self.all
    ACTIONS
  end
end