class SpeciesController < ApplicationController
  def view

    @all_species = Species.all

    #no params -- no nothing
    #empty param
    #valid param
    #taken param

    if params[:species].nil?
      @all_species = Species.all
    elsif params[:species].strip.empty?
      redirect_to '/'
    else
      species_name = params[:species].capitalize
      if Species.where("name='#{species_name}'").count == 0
        @species = Species.create!(name:species_name)
        @all_species = Species.all
      else
        flash[:notice] = "That species is already in the database."
        redirect_to '/'
      end
    end
  end
end
