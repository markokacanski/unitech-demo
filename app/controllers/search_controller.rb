class SearchController < ApplicationController
  def index
    @items = UnitechItem.search(params[:search])
  end
end
