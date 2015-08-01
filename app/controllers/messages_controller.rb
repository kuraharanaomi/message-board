class MessagesController < ApplicationController
  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path, notice: 'Message saved.'
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'Message saved.'
    else
      @messages = Message.all
      flash.now[:alert] = "Failed to save message."
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end
