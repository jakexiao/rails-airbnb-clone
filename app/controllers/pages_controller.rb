class PagesController < ApplicationController
  def home
    if params[:query]
      @flats = Flat.where("name LIKE '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
    
  end
end
