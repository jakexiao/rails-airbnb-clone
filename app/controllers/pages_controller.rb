class PagesController < ApplicationController
  def home
    if params[:query]
      @flats = Flat.where("address ILIKE '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
  end
end
