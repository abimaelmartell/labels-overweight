class FedexService
  MAX_RETRIES = 5

  def fedex_api
    @fedex_api ||= Fedex::Shipment.new(credentials)
  end

  def track_package(tracking_number)
    fedex_api.track(tracking_number: tracking_number)
  rescue Fedex::RateError => error
    @retries ||= 0

    if @retries > MAX_RETRIES
      @retries += 1
      retry
    else
      raise error
    end
  end

private

  def credentials
    Rails.application.credentials.fedex
  end
end
