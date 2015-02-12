class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @building = current_user.building
  end
end
