class RolesController < ApplicationController

  def index 
    play_id = params[:play_id]
    @roles = Role.order(:name).where(play_id: play_id)
    @play = Play.find(play_id)
  end

end