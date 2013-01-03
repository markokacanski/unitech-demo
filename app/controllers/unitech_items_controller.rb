class UnitechItemsController < ApplicationController
  def index
    @items = UnitechItem.search(params[:search])
  end
end
