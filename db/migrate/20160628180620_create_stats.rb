class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|

      t.timestamps null: false
    end
  end
end
