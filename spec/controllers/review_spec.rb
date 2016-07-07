require 'rails_helper'

describe ReviewsController do
  before(:each) { sign_in user }
  after(:each) { sign_out user }
  subject do
    product = Product.first
    review = FactoryGirl.build(:review, product: product, user: user)
    post :create, product_id: product, review: review.attributes
  end

  describe  'can create review' do
    let(:user) { FactoryGirl.create(:user, role: FactoryGirl.create(:role, actions: ['create_reviews'])) }
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