# frozen_string_literal: true

class RepostsController < ApplicationController
  def create
    repost = Repost.new(repost_params)
    if repost.save
      redirect_to request.referer, notice: 'リポストしました。'
    else
      redirect_to request.referer, notice: 'リポストできませんでした。'
    end
  end

  def destroy
    repost = Repost.find_by(repost_params)
    repost.destroy
    redirect_to request.referer, notice: 'リポストを解除しました。'
  end

  private

  def repost_params
    params.permit(:user_id, :post_id)
  end
end
