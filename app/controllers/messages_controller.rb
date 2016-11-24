class MessagesController < ApplicationController
  # GET /messages
  # Display all threads
  def index
  end

  # GET /messages/:id
  def show
    @partner_id = params[:user_id]
  end
end
