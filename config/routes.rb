Rails.application.routes.draw do
  root to: "labels#overweight_report"
  put "/labels/batch_create"
end
