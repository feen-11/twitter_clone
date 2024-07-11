# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.where(parent_id: nil)
                 .order(created_at: :desc)
                 .includes(user: { avatar_attachment: :blob },
                           images_attachments: :blob)
                 .page(params[:page])
                 .per(10)
    return unless current_user

    @following_posts = current_user.following_posts_and_reposts
                                   .includes(user: { avatar_attachment: :blob },
                                             images_attachments: :blob)
                                   .page(params[:page])
                                   .per(10)
  end
end
