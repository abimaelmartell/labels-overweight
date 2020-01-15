class LabelCarrier
  attr_accessor :label, :carrier_service

  def initialize(label)
    @label = label
    @carrier_service = carrier_class.new(label)
  end

  def update_carrier_data!
    carrier_data = carrier_service.get_label_weight

    label.update!(
      carrier_weight: carrier_data[:value],
      carrier_weight_unit: carrier_data[:units]
    )
  end

  def carrier_class
    case label.carrier
    when "FEDEX"
      Carriers::Fedex
    else
      raise NotImplementedError, "Carrier #{label.carrier} not implemented"
    end
  end
end
