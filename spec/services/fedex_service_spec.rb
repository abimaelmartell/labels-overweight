require 'rails_helper'

RSpec.describe FedexService do
  describe "#track_package" do
    it "should properly retry for failures" do
      service = FedexService.new

      # expect_any_instance_of(Fedex::Shipment).to receive(:track).exactly(4).times.and_raise(Fedex::RateError)
      # expect { service.track_package("") }.to raise_error(Fedex::RateError)
    end
  end
end
