class ChatGroupsController < ApplicationController

  def index
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    ChatGroup.create(chat_group_params)
    redirect_to controller: :chat_groups, action: :index
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:group_name, { :user_ids => []})
  end

end
