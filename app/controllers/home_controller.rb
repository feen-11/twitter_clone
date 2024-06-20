# frozen_string_literal: true

class HomeController < ApplicationController
  def index 
    @posts = Post.all.order(created_at: :desc)
    @followed_posts = current_user.followed_posts if current_user
  end
end
