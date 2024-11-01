# frozen_string_literal: true

class AddLikesCountAndIsPublishedToTweets < ActiveRecord::Migration[7.0]
  def change
    change_table :tweets, bulk: true do |t|
      t.integer :likes_count, default: 0, null: false
      t.boolean :is_published, default: false, null: false
    end
  end
end
