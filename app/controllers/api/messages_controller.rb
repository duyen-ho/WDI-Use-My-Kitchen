class Api::MessagesController < ApplicationController
  # GET /api/messages
  # Return all user conversations
  def index
    conversations = Message
      .where('sender_id = ? OR recipient_id = ?', session[:user_id], session[:user_id])
      .map do |message|
        message.sender_id == session[:user_id] ? message.recipient : message.sender
      end
      .map do |user|
        {
          user: {
            id: user.id,
            name: user.name
          }
        }
      end.uniq

    render json: conversations
  end
end
