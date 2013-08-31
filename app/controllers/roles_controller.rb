class RolesController < ApplicationController

  def index 
    @roles = Role.order(:name)
    @play = Play.find(params[:play_id])
  end

end