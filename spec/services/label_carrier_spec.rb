require 'rails_helper'

RSpec.describe LabelCarrier do
  describe "#initialize" do
    it "should properly set carrier class" do
      label = create(:label)
      carrier = LabelCarrier.new(label)
      expect(carrier.carrier_service).to be_instance_of(Carriers::Fedex)
    end

    it "should raise error if not implemented carrier" do
      label = build(:label, carrier: "USPS")
      expect { LabelCarrier.new(label) }.to raise_error(NotImplementedError)
    end
  end

  describe "#update_carrier_data!" do
    it "should update label with carrier data" do
      label = create(:label)
      carrier = LabelCarrier.new(label)

      expect_any_instance_of(Carriers::Fedex).to receive(:get_label_weight).and_return( value: 1.1, units: "LB")
      expect {
        carrier.update_carrier_data!
      }.to change { label.carrier_weight }.to(1.1)
       .and change { label.carrier_weight_unit }.to("LB")
    end
  end
end
