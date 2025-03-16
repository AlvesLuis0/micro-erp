class CitiesController < ApplicationController
  def index
    @q = City.ransack(params[:q])
    @states = @q.result
      .select(:id, :description, :state_id, states: { description: :state_description })
      .joins(:state)
      .group_by { |city| [ city.state_id, city.state_description ] }
    render layout: false
  end
end
