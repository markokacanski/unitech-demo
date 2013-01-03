class UnitechItem < ActiveRecord::Base
  attr_accessible :cat1, :cat2, :cat3, :cat4, :desc, :manufacturer, :manufacturer_pb, :model, :name, :price, :quantity, :unit, :weight
end
