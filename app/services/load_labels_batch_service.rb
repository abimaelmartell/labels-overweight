class LoadLabelsBatchService
  def initialize(data)
    @data = data
  end

  def load!
    @data.each do |entry|
      save_label(entry)
    end
  end

private

  def save_label(entry)
    label = Label.create!(
      tracking_number: entry["tracking_number"],
      carrier: entry["carrier"]
    )

    label.create_parcel!(
      length: entry["parcel"]["length"],
      width: entry["parcel"]["width"],
      height: entry["parcel"]["height"],
      weight: entry["parcel"]["weight"],
      mass_unit: entry["parcel"]["mass_unit"],
      distance_unit: entry["parcel"]["distance_unit"]
    )

    carrier = LabelCarrier.new(label)
    carrier.update_carrier_data!
  end
end
