# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = Follow.new(follow_params)
    if follow.save
      redirect_to request.referer, notice: 'フォローしました。'
    else
      redirect_to request.referer, notice: 'フォローできませんでした。'
    end
  end

  def destroy
    follow = Follow.find_by(follow_params)
    follow.destroy
    redirect_to request.referer, notice: 'フォローを解除しました。'
  end

  private

  def follow_params
    params.permit(:follower_id, :following_id)
  end
end
