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
  biography: '埼玉県生まれ東京勤務です。エンジニア目指して勉強中',
  website: 'https://github.com/feen-11',
  location: '東京都',
  confirmed_at: Time.zone.now
)
user01.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/leaf.png')),
                     filename: 'leaf.png')
user01.header.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/header.jpg')),
                     filename: 'header.jpg')
user01.save!

user02 = User.new(
  name: 'ユーザー2',
  email: 'user02@email.com',
  phone_number: '12345678901',
  birthday: 19_981_115,
  password: 'user02',
  biography: '現役エンジニア。スキルアップのためスクールで勉強中',
  website: 'https://happiness-chain.com/',
  location: '北海道',
  confirmed_at: Time.zone.now
)
user02.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/cherry_blossoms.png')),
                     filename: 'cherry_blossoms.png')
user02.save!

user03 = User.new(
  name: 'ユーザー3',
  email: 'user03@email.com',
  phone_number: '23456789012',
  birthday: 19_981_116,
  password: 'user03',
  confirmed_at: Time.zone.now
)
user03.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/whale.png')),
                     filename: 'whale.png')
user03.save!

# Posts
post01 = Post.new(
  user_id: user01.id,
  content: '今日は天気が良かったのでサイクリングに行きました。'
)
post01.save!

post02 = Post.new(
  user_id: user01.id,
  content: '筋トレしてきました！'
)
post02.save!

post03 = Post.new(
  user_id: user01.id,
  content: 'プロテインうまい'
)
post03.save!

post04 = Post.new(
  user_id: user01.id,
  content: '筋肉痛やばい'
)
post04.save!

post05 = Post.new(
  user_id: user01.id,
  content: '今日は背中の日！'
)
post05.save!

post06 = Post.new(
  user_id: user02.id,
  content: '今日は天気が悪かったので1日家で過ごしました。'
)
post06.save!

post07 = Post.new(
  user_id: user02.id,
  content: '雨だとプログラミング捗る〜'
)
post07.save!

post08 = Post.new(
  user_id: user02.id,
  content: 'Rails楽しい'
)
post08.save!

post09 = Post.new(
  user_id: user02.id,
  content: 'フロントも勉強しないと'
)
post09.save!

post10 = Post.new(
  user_id: user02.id,
  content: 'バリバリのエンジニアになりたい〜'
)
post10.save!

post11 = Post.new(
  user_id: user03.id,
  content: '今日からキャンプ行ってきます！'
)
post11.save!

post12 = Post.new(
  user_id: user03.id,
  content: '富士山が見えるキャンプ場ついた〜'
)
post12.save!
post12.images.attach(io: File.open(Rails.root.join('app/assets/images/seed/post/fuji.jpg')),
                     filename: 'fuji.jpg')

post13 = Post.new(
  user_id: user03.id,
  content: '肉うま'
)
post13.save!

post14 = Post.new(
  user_id: user03.id,
  content: '焚き火最高'
)
post14.save!
post15 = Post.new(
  user_id: user03.id,
  content: 'マシュマロ焼きます'
)
post15.save!
post16 = Post.new(
  user_id: user03.id,
  content: '花火する'
)
post16.save!
post17 = Post.new(
  user_id: user03.id,
  content: '雨降ってきた'
)
post17.save!
post18 = Post.new(
  user_id: user02.id,
  content: 'おやすみなさい'
)
post18.save!
post19 = Post.new(
  user_id: user02.id,
  content: 'おはよう！'
)
post19.save!

# Follows
follow01 = Follow.new(
  follower_id: user01.id,
  following_id: user02.id
)
follow01.save!

follow02 = Follow.new(
  follower_id: user02.id,
  following_id: user01.id
)
follow02.save!

follow03 = Follow.new(
  follower_id: user02.id,
  following_id: user03.id
)
follow03.save!

follow04 = Follow.new(
  follower_id: user03.id,
  following_id: user02.id
)
follow04.save!

# likes

like01 = Like.new(
  post_id: post06.id,
  user_id: user01.id
)
like01.save!

like02 = Like.new(
  post_id: post07.id,
  user_id: user01.id
)
like02.save!

like03 = Like.new(
  post_id: post08.id,
  user_id: user01.id
)
like03.save!

like04 = Like.new(
  post_id: post09.id,
  user_id: user01.id
)
like04.save!

like05 = Like.new(
  post_id: post10.id,
  user_id: user01.id
)
like05.save!

like06 = Like.new(
  post_id: post01.id,
  user_id: user02.id
)
like06.save!

like07 = Like.new(
  post_id: post02.id,
  user_id: user02.id
)
like07.save!

like08 = Like.new(
  post_id: post03.id,
  user_id: user02.id
)
like08.save!

like09 = Like.new(
  post_id: post04.id,
  user_id: user02.id
)
like09.save!

like10 = Like.new(
  post_id: post05.id,
  user_id: user02.id
)
like10.save!

like11 = Like.new(
  post_id: post01.id,
  user_id: user03.id
)
like11.save!

like12 = Like.new(
  post_id: post03.id,
  user_id: user03.id
)
like12.save!

like13 = Like.new(
  post_id: post05.id,
  user_id: user03.id
)
like13.save!

like14 = Like.new(
  post_id: post07.id,
  user_id: user03.id
)
like14.save!

like15 = Like.new(
  post_id: post09.id,
  user_id: user03.id
)
like15.save!

# reposts

repost01 = Repost.new(
  post_id: post07.id,
  user_id: user01.id
)
repost01.save!

repost02 = Repost.new(
  post_id: post08.id,
  user_id: user01.id
)
repost02.save!

repost03 = Repost.new(
  post_id: post12.id,
  user_id: user01.id
)
repost03.save!

repost04 = Repost.new(
  post_id: post01.id,
  user_id: user02.id
)
repost04.save!

repost05 = Repost.new(
  post_id: post04.id,
  user_id: user02.id
)
repost05.save!

repost06 = Repost.new(
  post_id: post11.id,
  user_id: user02.id
)
repost06.save!

repost07 = Repost.new(
  post_id: post12.id,
  user_id: user03.id
)
repost07.save!

repost08 = Repost.new(
  post_id: post06.id,
  user_id: user03.id
)
repost08.save!

repost09 = Repost.new(
  post_id: post03.id,
  user_id: user03.id
)
repost09.save!

# comments

comment01 = Comment.new(
  post_id: post06.id,
  user_id: user01.id,
  content: '家で過ごす1日もいいですよね^^'
)
comment01.save!

comment02 = Comment.new(
  post_id: post12.id,
  user_id: user01.id,
  content: 'うらやま'
)
comment02.save!

comment03 = Comment.new(
  post_id: post02.id,
  user_id: user02.id,
  content: '今日はどの部位？'
)
comment03.save!

comment04 = Comment.new(
  post_id: post14.id,
  user_id: user02.id,
  content: 'チルっすね'
)
comment04.save!

comment05 = Comment.new(
  post_id: post01.id,
  user_id: user03.id,
  content: '今度一緒にいきましょ'
)
comment05.save!

comment06 = Comment.new(
  post_id: post08.id,
  user_id: user03.id,
  content: '自分も今勉強中です'
)
comment06.save!