class PowerController < ApplicationController


  def index

    if params[:amps].present? && params[:voltage_type].present? && params[:power_factor].present? && params[:volts].present?
      validate(Amps.new(params[:amps]).ac_three_to_watts(params[:volts], params[:voltage_type], params[:power_factor]))
    elsif params[:watts].present?
      validate(Watt.new(params[:watts]))
    elsif params[:kilowatts].present?
      validate(Kilowatt.new(params[:kilowatts]))
    elsif params[:megawatts].present?
      validate(Megawatt.new(params[:megawatts]))
    else
      render_error
    end

  end

  private

  def power_output(obj)
    {:watts => obj.watts, :kilowatts => obj.kilowatts, :megawatts => obj.megawatts, :status_code => 200}
  end

  def validate(obj)
    if obj.to_s == 'calc_error'
      render_calculation_error
    else
      render_valid(obj)
    end
  end

  def render_valid(obj)
    render status: 200, json: power_output(obj).to_json
  end

  def render_error
    render status: 401, json: {:message => "Invalid request, please try again", :status_code => 401}.to_json
  end

  def render_calculation_error
    render status: 401, json: {:message => "Invalid entry data, please check input values or read API documentation for more information", :status_code => 401}.to_json
  end


end
