# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "sol@gmail.com", password: "asdf")
User.create!(email: "jenny@gmail.com", password: "asdf")
User.create!(email: "brian@gmail.com", password: "asdf")
User.create!(email: "danilo@gmail.com", password: "asdf")

FriendCircle.create!(user_id: 1, name: "Sol's best friends")
FriendCircle.create!(user_id: 2, name: "Jenny's best friends")
FriendCircle.create!(user_id: 3, name: "Brian's best friends")
FriendCircle.create!(user_id: 4, name: "Danilo's best friends")

FriendCircleMembership.create!(circle_id: 1, member_id: 2)
FriendCircleMembership.create!(circle_id: 1, member_id: 3)
FriendCircleMembership.create!(circle_id: 1, member_id: 4)

FriendCircleMembership.create!(circle_id: 2, member_id: 1)
FriendCircleMembership.create!(circle_id: 2, member_id: 3)

FriendCircleMembership.create!(circle_id: 3, member_id: 1)
FriendCircleMembership.create!(circle_id: 3, member_id: 2)