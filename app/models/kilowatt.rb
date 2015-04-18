class Kilowatt
  attr_accessor :kilowatts

  def initialize(kilowatts)
    @kilowatts = kilowatts.to_i
  end

  def to_kw
    @kilowatts.to_f
  end

  def to_w
    @kilowatts * 1000.to_f
  end

  def to_mw
    @kilowatts / 1000.to_f
  end




end