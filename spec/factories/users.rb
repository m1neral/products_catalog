FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '1q2w3e4r'
    password_confirmation '1q2w3e4r'

    trait :categories_admin do
      role FactoryGirl.create(:categories_admin)
    end

    trait :products_admin do
      role FactoryGirl.create(:products_admin)
    end

    trait :users_admin do
      role FactoryGirl.create(:users_admin)
    end

    trait :something_admin do
      role FactoryGirl.create(:something_admin)
    end

    factory :user_categories_admin, traits: [:categories_admin]
    factory :user_products_admin, traits: [:products_admin]
    factory :user_users_admin , traits: [:users_admin]
    factory :user_something_admin, traits: [:something_admin]
  end
end
