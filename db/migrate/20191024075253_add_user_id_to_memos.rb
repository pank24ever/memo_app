class AddUserIdToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :user_id, :string
    add_column :memos, :integer, :string
  end
end
