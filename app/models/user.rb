# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :replies, lambda {
                       where.not(parent_id: nil)
                     }, class_name: 'Post', foreign_key: 'user_id', inverse_of: :parent, dependent: :destroy
  has_many :followers, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy,
                       inverse_of: :follower
  has_many :followings, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy,
                        inverse_of: :following
  has_many :follower_users, through: :followings, source: :follower
  has_many :following_users, through: :followers, source: :following
  has_many :likes, dependent: :destroy
  has_many :liking_posts, through: :likes, source: :post
  has_many :reposts, dependent: :destroy
  has_many :reposting_posts, through: :reposts, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_posts, through: :bookmarks, source: :post
  has_many :direct_message_entries, dependent: :destroy
  has_many :direct_messages, dependent: :destroy
  has_many :direct_message_rooms, through: :direct_message_entries
  has_many :notifications, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :header
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]
  after_create :set_default_avatar
  validates :phone_number, presence: true, unless: -> { provider == 'github' }
  validates :birthday, presence: true, unless: -> { provider == 'github' }
  validates :name, presence: true
  validates :name, length: { maximum: 50, message: 'は50文字以内で入力してください。' }
  validates :biography, length: { maximum: 160, message: 'は160文字以内で入力してください。' }
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  validates :website, format: {
                        with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
                        message: 'URLの形式が正しくありません。'
                      },
                      allow_blank: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'の形式が正しくありません。' }

  def self.form_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.confirmed_at = Time.zone.now
      user.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/avatar_default.png')),
                         filename: 'avatar_default.png')
    end
  end

  def following_posts
    Post.where(user: following_users,
               parent_id: nil).or(Post.where(id: Repost.where(user: following_users).select(:post_id)))
  end

  def following?(user)
    following_users.include?(user)
  end

  def set_default_avatar
    unless avatar.attached?
      avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed/user/avatar_default.png')), filename: 'avatar_default.png')
    end
  end
end
