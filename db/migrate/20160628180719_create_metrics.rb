class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :label
      t.timestamps null: false
    end
  end
end
