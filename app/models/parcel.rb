class Parcel < ApplicationRecord
  belongs_to :label

  validates_presence_of :label, :length, :width, :height,
                        :weight, :distance_unit, :mass_unit

  validates_inclusion_of :distance_unit, in: ["CM", "IN"]
  validates_inclusion_of :mass_unit, in: ["KG", "LB"]

  def volumetric_weight_in_kg
    VolumetricWeightCalculator.calculate(width, height, length, distance_unit)
  end

  def weight_in_kg
    mass_unit == "LB" ? UnitConverter.lb_to_kg(weight) : weight
  end

  def total_weight_in_kg
    [volumetric_weight_in_kg, weight_in_kg].max.ceil
  end
end
