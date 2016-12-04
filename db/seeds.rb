# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# データ作成開始　コメント
puts "seeds runninng..."

# ユーザー
User.create!(username:  "Example User",
             email:     "example@railstutorial.org",
             password: "foobar")
print "."
99.times do |n|
  username  = Faker::Name.name + (n+1).to_s
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: username,
               email:    email,
               password: password)
  print "."
end
puts "\n-> User_seeds OK!!"

# 投稿データ
users = User.order(:created_at).take(6)
50.times do
  users.each do |user|
    user.contentposts.create!(content: Faker::Lorem.sentence(5),
                              title: Faker::Lorem.word)
    print "."
  end
end
puts "\n-> Contentpost_seeds OK!!"

# データ作成終了　コメント
puts "\n=> All_seeds OK!!"