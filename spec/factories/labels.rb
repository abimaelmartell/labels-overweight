FactoryGirl.define do
  factory :label do
    carrier "FEDEX"
    tracking_number SecureRandom.alphanumeric(20)
    parcel nil
  end

  factory :parcel do
    length 2.0
    width 2.0
    height 2.0
    weight 2.0
    distance_unit "CM"
    mass_unit "KG"
  end
end
