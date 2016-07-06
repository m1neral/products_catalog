require 'rails_helper'

describe Role do
  it 'is invalid with not declared actions' do
    FactoryGirl.build(:role, actions: rand(0..Action.all.count).times.map { Faker::Name.name }).should be_invalid
  end

  it 'is valid with declared actions' do
    FactoryGirl.build(:role, actions: (rand(0..Action.all.count).times.map { Action.all.sample }).uniq).should be_valid
  end
end