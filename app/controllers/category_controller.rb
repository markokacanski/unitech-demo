class CategoryController < ApplicationController
  def show
    if params[:categories]
      @cat = params[:categories].split("/")
    end
  end
end
