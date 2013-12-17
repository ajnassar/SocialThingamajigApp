class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :circle_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
    add_index :friend_circle_memberships, :circle_id
    add_index :friend_circle_memberships, :member_id
  end
end
