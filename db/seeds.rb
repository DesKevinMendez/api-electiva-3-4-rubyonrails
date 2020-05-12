# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
    Blog.create!(content: "blog #{n}", title: "title blog #{n}")
end


u = User.create!(name: "Kevin Mendez", email: "kevin@teip.io", username: "deskevinmendez")
u.tags.create!(name: "taggable user")

b = Blog.first
b.tags.create!(name: "taggable blog")
