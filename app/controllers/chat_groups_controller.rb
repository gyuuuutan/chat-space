class ChatGroupsController < ApplicationController

  def index
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      redirect_to root_path, notice: 'チャットグループが作成されました。'
    else
      redirect_to new_chat_group_path, alert: 'グループ名を入力してください。'
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:group_name, { :user_ids => []})
  end

end
