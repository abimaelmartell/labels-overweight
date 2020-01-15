require 'rails_helper'

RSpec.describe VolumetricWeightCalculator do
  it "should properly calculate volumetric weight" do
    result = VolumetricWeightCalculator.calculate(10, 10, 10, "CM")
    expect(result).to be(0.20)
  end
end
