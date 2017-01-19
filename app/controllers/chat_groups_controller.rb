class ChatGroupsController < ApplicationController

  def index
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    @chat_group.users << current_user
    if @chat_group.save
      flash[:notice] = 'チャットグループが作成されました。'
      render action: :index
    else
      flash[:alert] = 'チャットグループを作成できません。'
      render action: :new
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def update
    @chat_group = ChatGroup.find(params[:id])
    @chat_group.users << current_user
    if params[:user_id] = current_user.id
      @chat_group.update(chat_group_params)
      flash[:notice] = 'チャットグループが更新されました。'
      render action: :index
    else
      flash[:alert] = 'チャットグループを編集できません。'
      render action: :edit
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

end
