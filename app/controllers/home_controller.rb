# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    @following_posts = current_user.following_posts.page(params[:page]).per(10) if current_user
  end
end
