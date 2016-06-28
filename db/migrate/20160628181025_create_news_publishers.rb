class CreateNewsPublishers < ActiveRecord::Migration
  def change
    create_table :news_publishers do |t|
      t.string :label
      t.timestamps null: false
    end
  end
end
