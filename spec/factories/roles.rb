FactoryGirl.define do
  factory :role do

    trait :manage_categories do
      name 'categories_admin'
      actions %w(create_categories edit_categories destroy_categories)
    end

    trait :manage_products do
      name 'products_admin'
      actions %w(create_products edit_products destroy_products)
    end

    trait :manage_users do
      name 'users_admin'
      actions %w(edit_users destroy_users)
    end

    trait :manage_something do
      name 'something_admin'
      actions %w(edit_users create_categories destroy_products)
    end

    factory :categories_admin, traits: [:manage_categories]
    factory :products_admin, traits: [:manage_products]
    factory :users_admin, traits: [:manage_users]
    factory :something_admin, traits: [:manage_something]
  end
end