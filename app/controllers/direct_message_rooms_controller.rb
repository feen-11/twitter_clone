class DirectMessageRoomsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @direct_message_room = DirectMessageRoom.new
    if @direct_message_room.save
      DirectMessageEntry.create(user_id: current_user.id, direct_message_room_id: @direct_message_room.id)
      DirectMessageEntry.create(user_id: params[:target_user_id], direct_message_room_id: @direct_message_room.id)
      redirect_to user_direct_message_room_path(current_user, @direct_message_room)
    else
      redirect_to user_path(params[:user_id]), alert: 'ダイレクトメッセージルームの作成に失敗しました。'
    end
  end

  private

  def direct_message_room_params
    params.permit(:target_user_id)
  end
end
