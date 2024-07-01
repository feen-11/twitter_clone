# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @posts = Post.all.order(created_at: :desc).includes(user: { avatar_attachment: :blob },
                                                        images_attachments: :blob).page(params[:page]).per(10)
  end
end
