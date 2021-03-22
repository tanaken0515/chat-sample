class RoomChannel < ApplicationCable::Channel
  def subscribed
    if connected_user
      stream_for connected_user
    else
      stream_from 'guest'
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data['message'], speaker: connected_user)

    # 発言したUserへの配信
    if connected_user
      RoomChannel.broadcast_to(connected_user, { message: render_message(message, true) })
    end

    # 発言してないUserへの配信
    User.where.not(id: connected_user&.id).each do |user|
      RoomChannel.broadcast_to(user, { message: render_message(message, false) })
    end

    # ゲスト(ログインしていない人)への配信
    ActionCable.server.broadcast('guest', { message: render_message(message, false) })
  end

  private

  def render_message(message, owned)
    ApplicationController.render(partial: 'messages/message', locals: { message: message, owned: owned })
  end
end
