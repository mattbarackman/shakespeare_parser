class RolesController < ApplicationController

  def index 
    @roles = Role.alphabetical(new_direction)
  end

  def alphabetical
    @roles = Role.alphabetical(new_direction)
    render @roles
  end

  def line_count
    @roles = Role.line_count(new_direction)
    render @roles
  end

  def longest_speech
    @roles = Role.longest_speeches(new_direction)
    render @roles
  end

  def scene_count
    @roles = Role.scene_count(new_direction)
    render @roles
  end

  def scene_percentage
    @roles = Role.percentage_of_scenes(new_direction)
    render @roles
  end

  def new_direction
    if params["prev_direction"] != "desc"
      "desc"
    else
      "asc"
    end
  end

end