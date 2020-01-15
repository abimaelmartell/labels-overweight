module Carriers
  class Fedex < Base
    def get_label_weight
      track_package.details[:package_weight]
    end

    def track_package
      fedex = FedexService.new
      api_data = fedex.track_package(label.tracking_number)

      api_data.first
    end
  end
end
