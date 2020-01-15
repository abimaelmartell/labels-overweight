namespace :fetch_label_data do

  desc "Fetch"
  task fetch: :environment do
    labels = Label.where(carrier_weight_unit: nil, carrier_weight: nil)

    labels.each do |label|
      LabelCarrier.new(label).update_carrier_data!
    end
  end

end
