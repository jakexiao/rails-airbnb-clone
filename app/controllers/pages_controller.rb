class PagesController < ApplicationController
  def home
    if params[:query]
      @flats = Flat.where("name ILIKE '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
  end
end
