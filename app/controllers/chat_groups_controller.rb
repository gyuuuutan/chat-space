class ChatGroupsController < ApplicationController

  def index
    @group_id = GroupUser.where(user_id: current_user.id).group_id
    @group_name = ChatGroup.find(@group_id).group_name
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
