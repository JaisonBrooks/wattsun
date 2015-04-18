class PowerController < ApplicationController


  def index
    if params[:watts].present?
      render status: 200, json: power_output(Watt.new(params[:watts])).to_json
    elsif params[:kilowatts].present?
      render status:200, json: power_output(Kilowatt.new(params[:kilowatts])).to_json
    elsif params[:megawatts].present?
      render status:200, json: power_output(Megawatt.new(params[:megawatts])).to_json
    else
      render_error
    end

  end

  private

  def power_output(obj)
    {:watts => obj.watts, :kilowatts => obj.kilowatts, :megawatts => obj.megawatts, :response_code => 200}
  end

  def render_error
    render status: 404, json: {:message => "Invalid request, please try again", :error_code => 7}.to_json
  end


end
