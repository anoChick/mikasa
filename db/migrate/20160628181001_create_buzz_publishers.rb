class CreateBuzzPublishers < ActiveRecord::Migration
  def change
    create_table :buzz_publishers do |t|
      t.string :label
      t.timestamps null: false
    end
  end
end
