class BrandController < ApplicationController
  def show
    if params[:brands]
      brands = params[:brands].split("/")

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

    end
  end
end
