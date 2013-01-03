class CategoryController < ApplicationController
  def show
    if params[:categories]
      category = params[:categories].split("/")

      category.each_index do |i|
        category[i] = category[i].tr("_", " ")
      end

      if category[3]
        @items = UnitechItem.where("
          cat1 = '#{category[0]}'
          AND cat2 = '#{category[1]}'
          AND cat3 = '#{category[2]}'
          AND cat4 = '#{category[3]}'
        ")
      elsif category[2]
        @items = UnitechItem.where("
          cat1 = '#{category[0]}'
          AND cat2 = '#{category[1]}'
          AND cat3 = '#{category[2]}'
        ")
      elsif category[1]
        @items = UnitechItem.where("
          cat1 = '#{category[0]}'
          AND cat2 = '#{category[1]}'
        ")
      elsif category[0]
        @items = UnitechItem.where("
          cat1 = '#{category[0]}'
        ")
      else
        @items = UnitechItem.all
      end
    else
      @items = UnitechItem.all
    end
      
  end
end
