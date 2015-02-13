class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    if !current_user
      redirect_to new_user_session_path
    else
      @building = current_user.building
    end
  end
end
