namespace :unitech do
  require 'csv'    

  dir = File.dirname(__FILE__)
  desc "Importing unitech data"
  task :import => :environment do
    csv_text = File.read("#{dir}/proizvodi.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      UnitechItem.create!(row.to_hash.symbolize_keys)
    end
  end

  desc "delete all unitech data"
  task :delete => :environment do
    UnitechItem.delete_all
  end
end