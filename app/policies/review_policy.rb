class ReviewPolicy < ApplicationPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  def create?
    user.role.actions.include?(:create_reviews) if user
  end

  def destroy?
    (user.admin? || user == review.user) if user
  end

  def rails_admin?(action)
    case action
      when :new
        false
      when :edit
        user.role.actions.include?(:edit_reviews) if user
      when :destroy
        user.role.actions.include?(:destroy_reviews) if user
      else
        super
    end
  end
end