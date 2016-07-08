require 'rails_helper'

describe Role do
  subject do
    actions = rand(1...Action.all.count).times.map { action_method.call }
    FactoryGirl.build(:role, actions: actions)
  end

  context 'when invalid' do
    let(:action_method) { -> { Faker::Name.name } }
    
    it { is_expected.to be_invalid }
  end

  context 'when valid' do
    let(:action_method) { -> { Action.all.sample } }

    it { is_expected.to be_valid }
  end
end
