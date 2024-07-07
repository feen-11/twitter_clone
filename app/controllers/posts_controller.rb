# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :login_check
  def new; end

  def create
    @post = current_user.posts.build(post_params)
    flash[:notice] = if @post.save
                       '投稿しました。'
                     else
                       '投稿できませんでした。'
                     end
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.permit(:content, :images, :parent_id)
  end
end
