require 'rails_helper'

RSpec.describe Label, type: :model do
  describe "#tracking_number" do
    it "should validate for uniqueness" do
      label = create(:label)
      label2 = build(:label, tracking_number: label.tracking_number)

      expect(label2.valid?).to be(false)
    end

    it "should validate for presence" do
      label = build(:label, tracking_number: nil)
      expect(label.valid?).to be(false)
    end
  end

  describe "#is_overweight_parcel?" do
    it "should return true if parcel overweights label" do
      label = build(:label, carrier_weight: 1, carrier_weight_unit: "LB")
      label.parcel = build(:parcel, weight: "100", mass_unit: "KG")

      expect(label.is_overweight_parcel?).to be(true)
    end
  end
end
