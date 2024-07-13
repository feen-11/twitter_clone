# frozen_string_literal: true

class BookmarksController < ApplicationController
  def index
    @bookmarking_posts = current_user.bookmarking_posts
                                     .order(created_at: :desc)
                                     .includes(user: { avatar_attachment: :blob }, images_attachments: :blob)
                                     .page(params[:page])
                                     .per(10)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to request.referer, notice: 'ブックマークしました。'
    else
      redirect_to request.referer, notice: 'ブックマークできませんでした。'
    end
  end

  def destroy
    bookmark = Bookmark.find_by(bookmark_params)
    bookmark.destroy
    redirect_to request.referer, notice: 'ブックマークを解除しました。'
  end

  private

  def bookmark_params
    params.permit(:user_id, :post_id)
  end
end
