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

  # GET /api/messages/:user_id
  # Return all messages between current user and user id
  def show
    messages = Message
      .where('sender_id = ? AND recipient_id = ?
        OR sender_id = ? AND recipient_id = ?',
        session[:user_id], params[:user_id], params[:user_id], session[:user_id])

    render json: messages, include: {
      sender: {
        only: [:id, :name]
      }
    }
  end

  # POST /api/messages
  # Create new message
  def create
    message = Message.new
    message.content = params[:content]
    message.sender_id = session[:user_id]
    message.recipient_id = params[:recipient_id]

    if message.save
      render json: {
        success: true,
        result: message.as_json(include: {
          sender: {
            only: [:id, :name]
          }
        })
      }
    else
      render json: {
        success: false,
        errors: message.errors.full_messages
      }
    end
  end
end
