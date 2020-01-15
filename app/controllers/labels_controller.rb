class LabelsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:batch_create]

  def overweight_report
    @labels = Label.includes(:parcel).all
  end

  def batch_create
    service = LoadLabelsBatchService.new(batch_labels_params[:_json])
    service.load!

    render json: :ok
  end

  def batch_labels_params
    params.permit(_json: [
      :tracking_number,
      :carrier,
      parcel: [
        :length,
        :width,
        :height,
        :weight,
        :distance_unit,
        :mass_unit
      ]
    ])
  end
end
