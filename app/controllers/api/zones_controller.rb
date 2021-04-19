class Api::ZonesController < ApplicationController
  before_action :set_address

  def index
    render json: @schedules
  end

  private

    def set_address
      address = params[:address]
      @schedules = CheckPoint.new(GeocodeAddress.new(address).call).call
    end
end
