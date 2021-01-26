class ChangeUserIdToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :orders, :user_id, true
  end

  def down
    change_column_null :orders, :user_id, false
  end
end
