# frozen_string_literal: true

class DirectMessageRoomsController < ApplicationController
  def index
    @direct_message_rooms = current_user.direct_message_rooms
                                        .order(updated_at: :desc)
                                        .includes(direct_message_entries: { user: { avatar_attachment: :blob } })
  end

  def show
    @direct_message_room = DirectMessageRoom.includes(direct_message_entries: :user)
                                            .find(params[:id])
    @direct_messages = @direct_message_room.direct_messages
                                           .includes(:user)
                                           .order(created_at: :asc)
  end

  def create
    existing_room = find_existing_room(current_user.id, params[:target_user_id])
    if existing_room
      redirect_to user_direct_message_room_path(current_user, existing_room)
    else
      @direct_message_room = DirectMessageRoom.new
      if @direct_message_room.save
        DirectMessageEntry.create(user_id: current_user.id, direct_message_room_id: @direct_message_room.id)
        DirectMessageEntry.create(user_id: params[:target_user_id], direct_message_room_id: @direct_message_room.id)
        redirect_to user_direct_message_room_path(current_user, @direct_message_room)
      else
        redirect_to request.referer, alert: 'ダイレクトメッセージルームの作成に失敗しました。'
      end
    end
  end

  private

  def direct_message_room_params
    params.permit(:target_user_id)
  end

  def find_existing_room(user_id, target_user_id)
    DirectMessageRoom.joins(:direct_message_entries)
                     .where(direct_message_entries: { user_id: [user_id, target_user_id] })
                     .group('direct_message_rooms.id')
                     .having('COUNT(direct_message_entries.id) = 2')
                     .first
  end
end
