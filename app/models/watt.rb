class Watt
  attr_accessor :watts, :kilowatts, :megawatts, :watt_hours, :kilowatt_hours, :megawatt_hours

  def initialize(watts)
    @watts = watts.to_i
    @kilowatts = @watts / 1000.to_f
    @megawatts = @watts / 1000000.to_f
  end

  def to_energy(hours)
    @watt_hours = @watts * hours.to_i
    @kilowatt_hours = @kilowatts * hours.to_i
    @megawatt_hours = @megawatts * hours.to_i
  end
end