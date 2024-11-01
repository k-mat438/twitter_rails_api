class AddLikesCountAndIsPublishedToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :likes_count, :integer
    add_column :tweets, :is_published, :boolean
  end
end
