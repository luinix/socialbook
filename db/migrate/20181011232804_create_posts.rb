class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.datetime :publication_datetime
      t.text :content
      t.boolean :ready, default: false
      t.boolean :tweetable, default: false
      t.boolean :tweeted, default: false

      t.timestamps
    end
  end
end
