# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

user01 = User.new(
  name: 'ユーザー1',
  email: 'user01@email.com',
  phone_number: '01234567890',
  birthday: 19_981_114,
  password: 'user01',
  confirmed_at: Time.zone.now
)
user01.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/avatar_default.png')),
                     filename: 'avatar_default.png')
user01.save!

user02 = User.new(
  name: 'ユーザー2',
  email: 'user02@email.com',
  phone_number: '12345678901',
  birthday: 19_981_115,
  password: 'user02',
  confirmed_at: Time.zone.now
)
user02.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/avatar_default.png')),
                     filename: 'avatar_default.png')
user02.save!

user03 = User.new(
  name: 'ユーザー3',
  email: 'user03@email.com',
  phone_number: '23456789012',
  birthday: 19_981_116,
  password: 'user03',
  confirmed_at: Time.zone.now
)
user03.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/avatar_default.png')),
                     filename: 'avatar_default.png')
user03.save!

# Posts
post01_1 = Post.new(
  user_id: user01.id,
  content: '今日は天気が良かったのでサイクリングに行きました。'
)
post01_1.save!

post01_2 = Post.new(
  user_id: user01.id,
  content: '筋トレしてきました！'
)
post01_2.save!

post01_3 = Post.new(
  user_id: user01.id,
  content: 'プロテインうまい'
)
post01_3.save!

post01_4 = Post.new(
  user_id: user01.id,
  content: '筋肉痛やばい'
)
post01_4.save!

post01_5 = Post.new(
  user_id: user01.id,
  content: '今日は背中の日！'
)
post01_5.save!

post02_1 = Post.new(
  user_id: user02.id,
  content: '今日は天気が悪かったので1日家で過ごしました。'
)
post02_1.save!

post02_2 = Post.new(
  user_id: user02.id,
  content: '雨だとプログラミング捗る〜'
)
post02_2.save!

post02_3 = Post.new(
  user_id: user02.id,
  content: 'Rails楽しい'
)
post02_3.save!

post02_4 = Post.new(
  user_id: user02.id,
  content: 'フロントも勉強しないと'
)
post02_4.save!

post02_5 = Post.new(
  user_id: user02.id,
  content: 'フロントも勉強しないと'
)
post02_5.save!

post03_1 = Post.new(
  user_id: user03.id,
  content: '今日からキャンプ行ってきます！'
)
post03_1.save!

post03_2 = Post.new(
  user_id: user03.id,
  content: '富士山が見えるキャンプ場ついた〜'
)
post03_2.save!
post03_2.images.attach(io: File.open(Rails.root.join('app/assets/images/seed/post/fuji.jpg')),
                       filename: 'fuji.jpg')

# Follows
follow01 = Follow.new(
  follower_id: user01.id,
  followed_id: user02.id
)
follow01.save!

follow02_1 = Follow.new(
  follower_id: user02.id,
  followed_id: user01.id
)
follow02_1.save!

follow02_2 = Follow.new(
  follower_id: user02.id,
  followed_id: user03.id
)
follow02_2.save!

follow03 = Follow.new(
  follower_id: user03.id,
  followed_id: user02.id
)
follow03.save!
