class ChatGroupsController < ApplicationController

  before_action :set_chat_group, only: %i(edit update)

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
      redirect_to action: :index
    else
      flash[:alert] = 'チャットグループを作成できません。'
      render action: :new
    end
  end

  def edit
  end

  def update
    if @chat_group.users.include?(current_user)
      @chat_group.update(chat_group_params)
      @chat_group.users << current_user
      if @chat_group.save
        flash[:notice] = 'チャットグループが更新されました。'
        redirect_to action: :index
      end
    else
      flash[:alert] = 'チャットグループを編集できません。'
      render action: :edit
    end
  end

  private
  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

  def set_chat_group
    @chat_group = ChatGroup.find(params[:id])
  end

end
