class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :keyword, null:false
      t.references :news_publisher, null:false
      t.string :title
      t.text :body
      t.text :url
      t.timestamps null: false
    end
  end
end
