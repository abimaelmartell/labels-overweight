require 'rails_helper'

RSpec.describe UnitConverter do
  describe "#lb_to_kg" do
    it "should convert lb to kg" do
      result = UnitConverter.lb_to_kg(1)
      expect(result).to be(0.453592)
    end
  end

  describe "#in_to_cm" do
    it "should convert inches to cm" do
      result = UnitConverter.in_to_cm(1)
      expect(result).to be(2.54)
    end
  end
end
