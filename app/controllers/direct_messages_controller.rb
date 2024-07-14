class DirectMessagesController < ApplicationController

  def create
    @direct_message = DirectMessage.new(direct_message_params)
    @direct_message.user = current_user

    if @direct_message.save
      redirect_to user_direct_message_room_path(current_user, @direct_message.direct_message_room_id), notice: 'メッセージが送信されました。'
    else
      redirect_to user_direct_message_room_path(current_user, @direct_message.direct_message_room_id), alert: 'メッセージの送信に失敗しました。'
    end
  end

  private

  def direct_message_params
    params.permit(:content, :direct_message_room_id, :user_id)
  end
end
