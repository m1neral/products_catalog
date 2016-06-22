class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  def create?
    user.present?
  end

  def destroy?
    (user.admin? || user == review.user) if user
  end
end