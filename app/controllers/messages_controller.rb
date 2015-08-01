class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
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
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'Message edited.'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'Selected message deleted.'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
end
