class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :member_id

  belongs_to :friend_circle, foreign_key: :circle_id, class_name: "FriendCircle"
  belongs_to :member, foreign_key: :member_id, class_name: "User"
end