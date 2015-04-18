class EnergyController < ApplicationController
  skip_before_filter :verify_authenticity_token

def index

  if params[:watts].present? && params[:hours].present?
    obj = Watt.new(params[:watts])
    obj.to_energy(params[:hours])

    render status: 200, json: energy_output(obj).to_json
  elsif params[:watts].present? && params[:seconds].present?

    render status: 200, json: {joules: (params[:watts].to_i * params[:seconds].to_i)}.to_json
  elsif params[:kilowatts].present? && params[:hours].present?

    obj = Kilowatt.new(params[:kilowatts])
    obj.to_energy(params[:hours])

    render status: 200, json: energy_output(obj).to_json
  elsif params[:megawatts].present? && params[:hours].present?

    obj = Megawatt.new(params[:megawatts])
    obj.to_energy(params[:hours])

    render status: 200, json: energy_output(obj).to_json
  else
    render_error
  end

end

  private

  def energy_output(obj)
    {:watt_hours => obj.watt_hours, :kilowatt_hours => obj.kilowatt_hours, :megawatt_hours => obj.megawatt_hours, :response_code => 200}
  end

  def render_error
    render status: 404, json: {:message => "Invalid request, please try again", :error_code => 7}.to_json
  end
end
