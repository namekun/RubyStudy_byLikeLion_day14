# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do # 50개의 게시글을 만들어보자
    post = Post.create(title: Faker::Overwatch.quote, contents: Faker::WorldOfWarcraft.quote)
    10.times do # 100개의 게시글을 만들어보자
        post.comments.create(content: Faker::WorldOfWarcraft.quote)
    end
end