class Kilowatt
  attr_accessor :watts, :kilowatts, :megawatts, :watt_hours, :kilowatt_hours, :megawatt_hours

  def initialize(kilowatts)
    @kilowatts = kilowatts.to_i
    @watts = @kilowatts * 1000.to_f
    @megawatts = @kilowatts / 1000.to_f
  end

  def to_energy(hours)
    @watt_hours = @watts * hours.to_i
    @kilowatt_hours = @kilowatts * hours.to_i
    @megawatt_hours = @megawatts * hours.to_i
  end

end