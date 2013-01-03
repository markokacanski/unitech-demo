class BrandController < ApplicationController
  def show
    if params[:brands]
      brands = params[:brands].split("/")

      brands.each_index do |i|
        brands[i] = brands[i].tr("_", " ")
      end

      if brands[1]
        @items = UnitechItem.where("
          manufacturer = '#{brands[0]}'
          AND manufacturer_pb = '#{brands[1]}'
        ")
      elsif brands[0]
        @items = UnitechItem.where("
          manufacturer = '#{brands[0]}'
        ")
      else
        @items = UnitechItem.all
      end
    else
      @items = UnitechItem.all
    end

    manufacturers = UnitechItem.get_manufacturers
    @brands = Hash.new
    manufacturers.each do |manufacturer|
      @brands["#{manufacturer}"] = UnitechItem.get_podbrends(manufacturer)
    end

  end
end
