# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :reposts, dependent: :destroy
  has_many :reposting_users, through: :reposts, source: :user
  has_many :replied_relationships, class_name: 'ReplyRelationship', foreign_key: 'replied_id', dependent: :destroy
  has_many :replying_relationships, class_name: 'ReplyRelationship', foreign_key: 'replying_id', dependent: :destroy
  has_many :replied_posts, through: :replied_relationships, source: :replying
  has_many :replying_posts, through: :replying_relationships, source: :replied
end
