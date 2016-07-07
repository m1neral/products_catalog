FactoryGirl.define do
  factory :review do
    msg { Faker::Name.title }
  end
end