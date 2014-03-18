class AddColumnsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer
    add_column :tweets, :content, :text
  end
end
