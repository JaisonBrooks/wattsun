class Amps

  attr_accessor :amps

  def initialize(amps)
    @amps = amps.to_f
    @round = 4
  end

  def dc_to_watts(volts)
    Watt.new(@amps * volts.to_f)
  end

  def ac_single_to_watts(volts, power_factor)
    if power_factor.to_i <= 1
      Watt.new(power_factor.to_i * @amps * volts.to_f)
    else
      :calc_error
    end
  end

  def ac_three_to_watts(volts, voltage_type, power_factor)
    if voltage_type.to_s.downcase == 'l2l' && power_factor.to_f <= 1
      Watt.new((Math.sqrt(3).round(@round) * power_factor.to_f * @amps * volts.to_f).round(@round))
    elsif voltage_type.to_s.downcase == 'l2n'
      Watt.new((3 * power_factor.to_f * @amps * volts.to_f).round(@round))
    else
      :calc_error
    end
  end

end