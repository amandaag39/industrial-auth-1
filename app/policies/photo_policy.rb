# app/policies/photo_policy.rb

class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == photo.owner ||
      !photo.owner.private? ||
      photo.owner.followers.include?(user)
  end

  def update?
    user == photo.owner
    
  end

  def create?
    !user.nil?
  end

  def destroy?
    user == photo.owner
  end
end
