class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :category, index: true
      t.text :body
      t.belongs_to :admin, index: true

      t.timestamps
    end
  end
end
