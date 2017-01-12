class ChatGroupsController < ApplicationController

  def new
    @chat_group = ChatGroup.new
  end

end
