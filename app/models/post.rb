# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :reposts, dependent: :destroy
  has_many :reposting_users, through: :reposts, source: :user
end
