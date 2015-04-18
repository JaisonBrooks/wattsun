class PowerController < ApplicationController


  def index
    if params[:watts].present?
      watt = Watt.new(params[:watts])
      render status: 200, json: power_output(watt).to_json
    else
      render_error
    end

  end

  private

  def power_output(obj)
    {:watts => obj.watts, :kilowatts => obj.kilowatts, :megawgiatts => obj.megawatts, :code => 200}
  end

  def render_error
    render status: 404, json: {:message => "Invalid request, please try again", :error_code => 7}.to_json
  end


end
