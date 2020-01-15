class AddCarrierWeightToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :carrier_weight, :float
    add_column :labels, :carrier_weight_unit, :string
  end
end
