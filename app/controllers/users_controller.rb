# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :login_check
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc).includes(user: { avatar_attachment: :blob }, images_attachments: :blob).page(params[:page]).per(10)
    @liking_posts = @user.liking_posts.order(created_at: :desc).includes(user: { avatar_attachment: :blob }, images_attachments: :blob).page(params[:page]).per(10)
    @reposting_posts = @user.reposting_posts.order(created_at: :desc).includes(user: { avatar_attachment: :blob }, images_attachments: :blob).page(params[:page]).per(10)
    @replied_target_posts = @user.replied_to_posts.order(created_at: :desc).includes(user: { avatar_attachment: :blob }, images_attachments: :blob).page(params[:page]).per(10)
  end
end
