class Api::ZonesController < ApplicationController
  before_action :set_schedules

  def index
    render json: @schedules, include: :schedules
  end

  private

    def set_schedules
      lat = params[:lat].to_f
      lng = params[:lng].to_f
      @schedules = CheckPoint.new(lat, lng).call
    end
end
