class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friend_ids

  belongs_to :user

  has_many :friend_circle_memberships, foreign_key: :circle_id
  has_many :friends, through: :friend_circle_memberships, source: :member
end
