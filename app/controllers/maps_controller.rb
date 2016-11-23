class MapsController < ApplicationController
  def show
    render json: Map
  end
end
