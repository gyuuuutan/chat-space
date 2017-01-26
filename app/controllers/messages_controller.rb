class MessagesController < ApplicationController
  def index
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index
    else
      flash[:alert] = "メッセージを入力してください。"
      redirect_to action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, chat_group_id: params[:chat_group_id])
  end
end
