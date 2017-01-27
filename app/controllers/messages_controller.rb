class MessagesController < ApplicationController
  def index
<<<<<<< HEAD
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to chat_group_messages_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(chat_group_id: params[:chat_group_id])
  end

  def set_chat_group
=======
>>>>>>> master
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end
end
