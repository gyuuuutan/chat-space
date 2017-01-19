class ChatGroupsController < ApplicationController

  def index
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      render action: :index, notice: 'チャットグループが作成されました。'
    else
      render action: :new, alert: 'グループ名を入力してください。'
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

end
