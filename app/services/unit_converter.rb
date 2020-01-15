class UnitConverter
  LB_TO_KG_RATIO = 0.453592.freeze
  IN_TO_CM_RATIO = 2.54.freeze

  def self.lb_to_kg(lb)
    lb * LB_TO_KG_RATIO
  end

  def self.in_to_cm(inches)
    inches * IN_TO_CM_RATIO
  end
end
