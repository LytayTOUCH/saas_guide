class WeatherGridController < ApplicationController
  before_action :authenticate_user!
  def index
    @message="Variable from weather grid controller"
  end
end
