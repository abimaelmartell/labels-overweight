class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :tracking_number
      t.string :carrier

      t.timestamps
    end
  end
end
