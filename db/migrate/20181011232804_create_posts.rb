class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.datetime :publication_datetime
      t.text :content

      t.timestamps
    end
  end
end
