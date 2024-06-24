# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy,
                                 inverse_of: :follower
  has_many :follows_as_followed, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy,
                                 inverse_of: :follower
  has_one_attached :avatar
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

  def followed_posts
    return [] unless follows_as_follower.exists?

    Post.where(user_id: follows_as_follower.pluck(:followed_id))
  end
end
