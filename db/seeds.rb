# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = User.create(email: "test1@example.com", screen_name:"testA", password:"asdfgh")
a2 = User.create(email: "test2@example.com", screen_name:"testB", password:"asdfgh")
a3 = User.create(email: "test3@example.com", screen_name:"testC", password:"asdfgh")

x = Book.create(name:"Gatsby", goodreads_ID: "00000")

y1 = Club.create(name:"Jurassic Club", description: "SFO")
y2 = Club.create(name:"ePluribus", description: "SAN")

z1 = ReadingList.create(book_id: 1, club_id: 1)
z2 = ReadingList.create(book_id: 1, club_id: 2)

b1 = Membership.create(club_id: 1, user_id: 1)
b2 = Membership.create(club_id: 1, user_id: 2)
b2 = Membership.create(club_id: 2, user_id: 3)

puts a1, a2, a3
