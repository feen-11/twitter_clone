class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] =  '投稿しました。'
    else
      flash[:notice] =  '投稿できませんでした。'
    end
    redirect_to root_path
  end

  private

  def post_params
    params.permit(:content, :images)
  end
end
