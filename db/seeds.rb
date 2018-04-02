# ダミーデータを日本語にする
Faker::Config.locale = :ja

# ユーザー
User.create!(name:  "ないとう",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# 店リストを取得
file = File.open("./db/TestShopName.txt", "r")
shops = file.read().split("\n")

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
#  content = Faker::Lorem.sentence(5)
#  content = Faker::Dessert.variety
#  content = Faker::realText
  users.each do |user|
    # 店リストの中からランダムにcontentに格納
    content = shops[rand(shops.length)]
    
    # それぞれのユーザーで投稿を作成
    user.microposts.create!(content: content)
  end
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }