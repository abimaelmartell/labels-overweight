class VolumetricWeightCalculator
  VOLUMETRIC_DIVISOR = 5000.to_f

  def self.calculate(width, height, length, unit)
    if unit == "IN"
      width  = UnitConveter.in_to_cm(width)
      height = UnitConveter.in_to_cm(height)
      length = UnitConveter.in_to_cm(length)
    end

    (width * height * length) / VOLUMETRIC_DIVISOR
  end
end
