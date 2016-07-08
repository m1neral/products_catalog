require 'rails_helper'

describe ReviewsController do
  let(:product) { FactoryGirl.create(:product) }
  let(:review) { FactoryGirl.build(:review, product: product, user: user) }
  subject { post :create, product_id: product.id, review: review.attributes }

  before(:each) { sign_in user }
  after(:each) { sign_out user }

  describe 'can create review' do
    let(:user) do
      role = FactoryGirl.build(:role, actions: ['create_reviews'])
      FactoryGirl.create(:user, role: role)
    end
    
    it 'http status' do
      subject
      expect(response.status).to eq(302)
    end

    it 'exist in db' do
      expect { subject }.to change { Review.count }.by(1)
    end
  end

  describe 'can\'t create review' do
    let(:user) { FactoryGirl.create(:user_categories_admin) }

    it 'http status' do
      expect { subject }.to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
