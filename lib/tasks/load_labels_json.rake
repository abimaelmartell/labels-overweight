namespace :load_labels_json do

  desc "Load data from labels.json"
  task load: :environment do
    puts "Loading labels.json..."

    file = File.join(Rails.root, "db", "labels.json")
    json_string = File.read(file)
    data = JSON.parse(json_string)

    service = LoadLabelsBatchService.new(data)
    result = service.load!

    puts "Finished loading #{result.count} labels"
  end

end
