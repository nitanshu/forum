# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |d|
  ActiveRecord::Base.transaction do
    post = Post.create(title: "Title #{d}", body: "this is the body #{d}")
    comment = post.comments.create(body: "This is a comment on post #{d}")
    comment.comments.create(body: "This is a reply on comment #{comment.id}")
  end
end