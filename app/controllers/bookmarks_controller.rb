class BookmarksController < ApplicationController

  def index
    @bookmarking_posts = current_user.bookmarking_posts
                                     .order(created_at: :desc)
                                     .includes(user: { avatar_attachment: :blob },images_attachments: :blob)
                                     .page(params[:page])
                                     .per(10)
  end

  def create
  end

  def destroy
  end
end
