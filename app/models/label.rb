class Label < ApplicationRecord
  ENABLED_CARRIERS = %w(FEDEX).freeze

  has_one :parcel

  validates :tracking_number, presence: true, uniqueness: true
  validates :carrier, presence: true, inclusion: { in: ENABLED_CARRIERS }

  def is_overweight_parcel?
    if can_check_overweight?
      parcel.total_weight_in_kg > carrier_weight_in_kg
    end
  end

  def can_check_overweight?
    parcel.present? && carrier_weight && carrier_weight_unit
  end

  def carrier_weight_in_kg
    carrier_weight_unit == "LB" ?
      UnitConverter.lb_to_kg(carrier_weight) :
      carrier_weight
  end
end
