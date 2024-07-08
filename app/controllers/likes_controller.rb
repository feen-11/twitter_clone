class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    if @like.save
      redirect_to request.referer, notice: 'いいねしました。'
    else
      redirect_to request.referer, notice: 'いいねできませんでした。'
    end
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy
    redirect_to request.referer, notice: 'いいねを解除しました。'
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
