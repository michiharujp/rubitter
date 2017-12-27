class RemoveReplyToFromMicroposts < ActiveRecord::Migration[5.0]
  def change
    remove_column :microposts, :reply_to, :integer
  end
end
