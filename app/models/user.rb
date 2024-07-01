# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :followers, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy,
                       inverse_of: :follower
  has_many :followings, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy,
                        inverse_of: :following
  has_many :follower_users, through: :followings, source: :follower
  has_many :following_users, through: :followers, source: :following
  has_one_attached :avatar
  has_one_attached :header
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]
  validates :phone_number, presence: true, unless: -> { provider == 'github' }
  validates :birthday, presence: true, unless: -> { provider == 'github' }
  validates :name, presence: true
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

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
    Post.where(user: following_users)
  end
end
