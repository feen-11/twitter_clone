# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).includes(user: { avatar_attachment: :blob },
                                                        images_attachments: :blob).page(params[:page]).per(10)
    return unless current_user

    @following_posts = current_user.following_posts.includes(user: { avatar_attachment: :blob },
                                                             images_attachments: :blob).page(params[:page]).per(10)
  end
end
