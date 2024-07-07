# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :login_check
  def show
    @user = User.find(params[:id])
    @posts = posts_for(@user.posts)
    @liking_posts = posts_for(@user.liking_posts)
    @reposting_posts = posts_for(@user.reposting_posts)
    @replying_posts = posts_for(@user.replies)
  end

  private

  def posts_for(source)
    source.order(created_at: :desc)
          .includes(user: { avatar_attachment: :blob }, images_attachments: :blob)
          .page(params[:page]).per(10)
  end
end
