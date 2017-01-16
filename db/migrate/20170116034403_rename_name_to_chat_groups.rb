class RenameNameToChatGroups < ActiveRecord::Migration[5.0]
  def change
    rename_column :chat_groups, :name, :group_name
  end
end
