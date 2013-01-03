class UnitechItemsController < ApplicationController
  def index
    @items = UnitechItem.all
  end
end
