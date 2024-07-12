# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :reposts, dependent: :destroy
  has_many :reposting_users, through: :reposts, source: :user
  has_many :bookmarks, dependent: :destroy
  belongs_to :parent, class_name: 'Post', optional: true
  has_many :replies, class_name: 'Post', foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent
  validates :content, presence: true
  validates :content, length: { maximum: 140, message: 'は140文字以内で入力してください。' }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def reposted_by?(user)
    reposts.where(user_id: user.id).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
