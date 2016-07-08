class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  def create?
    user.role.create_reviews_allowed? if user
  end

  def destroy?
    (user.role.destroy_reviews_allowed? || user == review.user) if user
  end

  def rails_admin?(action)
    case action
      when :new
        false
      when :edit
        user.role.edit_reviews_allowed? if user
      when :destroy
        user.role.destroy_reviews_allowed? if user
      else super
    end
  end
end
