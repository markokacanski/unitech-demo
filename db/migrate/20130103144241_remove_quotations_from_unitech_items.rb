class RemoveQuotationsFromUnitechItems < ActiveRecord::Migration
  def up
    items = UnitechItem.all
    items.each do |item|
      item.name = item.name[1...-1] if !item.name.nil?
      item.cat1 = item.cat1[1...-1] if !item.cat1.nil?
      item.cat2 = item.cat2[1...-1] if !item.cat2.nil?
      item.cat3 = item.cat3[1...-1] if !item.cat3.nil?
      item.cat4 = item.cat4[1...-1] if !item.cat4.nil?
      item.manufacturer = item.manufacturer[1...-1] if !item.manufacturer.nil?
      item.manufacturer_pb = item.manufacturer_pb[1...-1] if !item.manufacturer_pb.nil?
      item.save
    end
  end

  def down
    items = UnitechItem.all
    items.each do |item|
      item.name = "\"#{item.name}\"" if !item.name.nil?
      item.cat1 = "\"#{item.cat1}\"" if !item.cat1.nil?
      item.cat2 = "\"#{item.cat2}\"" if !item.cat2.nil?
      item.cat3 = "\"#{item.cat3}\"" if !item.cat3.nil?
      item.cat4 = "\"#{item.cat4}\"" if !item.cat4.nil?
      item.manufacturer = "\"#{item.manufacturer}\"" if !item.manufacturer.nil?
      item.manufacturer_pb = "\"#{item.manufacturer_pb}\"" if !item.manufacturer_pb.nil?
      item.save
    end
  end
end
