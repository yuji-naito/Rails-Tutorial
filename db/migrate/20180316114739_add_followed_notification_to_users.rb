class AddFollowedNotificationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :followed_notification, :boolean, default: false
  end
end
