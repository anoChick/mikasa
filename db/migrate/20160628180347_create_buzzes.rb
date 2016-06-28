class CreateBuzzes < ActiveRecord::Migration
  def change
    create_table :buzzs do |t|
      t.references :keyword, null:false
      t.references :buzz_publisher, null:false
      t.text :body
      t.timestamps null: false
    end
  end
end
