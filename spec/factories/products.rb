FactoryGirl.define do
  factory :product do
    title { Faker::Name.name }
    category { FactoryGirl.create(:category) }
  end
end