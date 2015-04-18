class EnergyController < ApplicationController
  skip_before_filter :verify_authenticity_token


def index

  if params[:watts].present? && params[:hours].present?
    watt = Watt.new(params[:watts])
    watt.to_energy(params[:hours])
    render status: 200, json: energy_output(watt).to_json
  else
    render_error
  end

end

  private

  def energy_output(obj)
    {:watt_hours => obj.watt_hours, :kilowatt_hours => obj.kilowatt_hours, :megawatt_hours => obj.megawatt_hours, :code => 200}
  end

  def render_error
    render status: 404, json: {:message => "Invalid request, please try again", :error_code => 7}.to_json
  end
end
