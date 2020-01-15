class FedexService
  MAX_RETRIES = 2

  def fedex_api
    @fedex_api ||= Fedex::Shipment.new(credentials)
  end

  def track_package(tracking_number)
    Rails.logger.debug "Fetching Fedex Data for #{tracking_number}"
    fedex_api.track(tracking_number: tracking_number)
  rescue Fedex::RateError => error
    @retries ||= 0

    Rails.logger.debug "Error when fetching Fedex Data for #{tracking_number}"

    if @retries < MAX_RETRIES
      @retries += 1
      retry
    else
      raise error
    end
  end

  private

  def credentials
    {
      key: ENV["FEDEX_KEY"],
      password: ENV["FEDEX_PASSWORD"],
      account_number: ENV["FEDEX_ACCOUNT_NUMBER"],
      meter: ENV["FEDEX_METER"],
      mode: ENV["FEDEX_MODE"]
    }
  end
end
